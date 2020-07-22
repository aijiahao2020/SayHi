package com.xalz.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.xalz.bean.Activity;
import com.xalz.bean.ActivityUser;
import com.xalz.bean.FavoriteInfo;
import com.xalz.bean.User;
import com.xalz.bean.UserAndComment;
import com.xalz.bean.UserLabel;
import com.xalz.service.ActivityMemberService;
import com.xalz.service.ActivityService;
import com.xalz.service.CommentService;
import com.xalz.service.FavoriteInfoService;
import com.xalz.service.UserLabelService;
import com.xalz.service.UserService;
import com.xalz.tool.ImageUtils;

/**
 * 活动控制类
 * 
 * @author po
 *
 */
@Controller
public class ActivityController {

	// 活动操作类
	@Autowired
	ActivityService activityService;

	// 活动成员信息操作类
	@Autowired
	ActivityMemberService activityMemberService;

	// 活动点赞操作类
	@Autowired
	FavoriteInfoService favoriteInfoService;

	// 评论操作类
	@Autowired
	CommentService commentService;

	// 用户操作类
	@Autowired
	UserService userService;

	// 点赞
	@Autowired
	FavoriteInfoService foriteInfoService;

	// 用户标签
	@Autowired
	UserLabelService userLabelService;

	/**
	 * 跳转到添加用户界面
	 * 
	 * @return
	 */
	@RequestMapping("/toAddActiv")
	public String addActivity() {
		return "addActiv";
	}

	/**
	 * 添加活动
	 * 
	 * @param activity
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/addActiv")
	public String addActivity(Activity activity, HttpServletRequest request, Model model) throws IOException {
		System.out.println(activity);
		String activBill = ImageUtils.upload(request, activity.getFile());
		activity.setActivBill(activBill);
		activityService.createActiv(activity);
		return "addActiv";
	}

	/**
	 * 首页查询活动
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("/search")
	public String getActivByName(@RequestParam(value = "activName") String activName,
			@RequestParam(value = "address") String address, Map<String, List<ActivityUser>> map) {
		List<ActivityUser> activityUsers = activityService.getActivUserByNameAddress(activName, address);
		System.out.println(activityUsers);
		map.put("activityUsers", activityUsers);
		return "index";
	}

	/**
	 * 根据活动id查看活动详细内容
	 * 
	 * @param activId
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/index/{id}", method = RequestMethod.GET)
	public String getActivByActivId(@PathVariable("id") Integer activId, Map<String, Object> map, HttpSession session) {
		// 1、根据activId获取活动信息
		Activity activity = activityService.getActivByPrimaryKey(activId);
		System.out.println(activity);
		// 获取参与人数
		Integer memberNum = activityMemberService.getActvityMemberCount(activId);
		// 2、根据activId获取活动成员信息
		List<User> activMem = activityMemberService.getUserListByActivity(activId);
		// 2.1、判断用户是否已参加
		User user = (User) session.getAttribute("user");
		System.out.println(user + "+++++++++++");
		boolean isAttented = false;
		if(user != null)
		isAttented = activityMemberService.queryActvityMember(user.getUserId(), activId);
		System.out.println(isAttented);
		// 3、根据activId获取评论信息
		List<UserAndComment> comments = commentService.getUserCommentByActivId(activId);
		// 4、根据活动标签获取推荐活动
		List<ActivityUser> activUsers = activityService.getActivAndRecommentByActivId(activId);
		System.out.println(activUsers);
		// 放入map中
		map.put("activity", activity);
		map.put("memberNum", memberNum);
		// 是否参加
		map.put("isAttented", isAttented);
		map.put("activMem", activMem);
		map.put("comments", comments);
		map.put("activUsers", activUsers);
		return "activSpecificInfo";
	}

	@RequestMapping("/favoriteActiv")
	public String favoriteActiv(FavoriteInfo favoriteInfo) {
		// 添加点赞信息
//		favoriteInfoService.addFavoriteInfo(favoriteInfo);
		return null;
	}

	/**
	 * 获取所有活动：未登录
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("/index")
	public String getAllActiv(Map<String, Object> map, HttpSession session) {
		System.out.println(activityService.getAllActiv());
		User user = (User) session.getAttribute("user");
		System.out.println(user+"sssssssssss");
		// 主页两个标签
		String userLabel1 = "摄影";
		String userLabel2 = "食品";
		// 根据标签获取的活动
		List<ActivityUser> activUsers1 = null;
		List<ActivityUser> activUsers2 = null;
		if (user != null) {
			// 获取用户第一个标签
			userLabel1 = userLabelService.queryUserLabelByUserId(user.getUserId(), 1);
			// 获取用户第二个标签
			userLabel2 = userLabelService.queryUserLabelByUserId(user.getUserId(), 2);

			// 根据用户标签获取活动
			activUsers1 = activityService.getActivUserByActivLabel(userLabel1);
			activUsers2 = activityService.getActivUserByActivLabel(userLabel2);

			// 获取用户推荐活动

			// .........

		} else {
			activUsers1 = activityService.getActivUserByActivLabel("科技");
			activUsers2 = activityService.getActivUserByActivLabel("人文");
		}
//		activityService.getActivUserByActivLabel(activLabel);
//		activityService.
		map.put("userLabel1", userLabel1);
		map.put("userLabel2", userLabel2);
		map.put("activUsers1", activUsers1);
		map.put("activUsers2", activUsers2);
		return "index";
	}

	/**
	 * 获取所有活动：已登录
	 * 
	 * @param map
	 * @return
	 *//*
		 * @RequestMapping("/userIndex") public String getAllActivByUser(Map<String,
		 * Object> map) { System.out.println(activityService.getAllActiv());
		 * map.put("activities", activityService.getAllActiv()); return "index"; }
		 */

}
