package com.xalz.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xalz.bean.Activity;
import com.xalz.bean.Comment;
import com.xalz.bean.FavoriteInfo;
import com.xalz.bean.User;
import com.xalz.bean.UserAndComment;
import com.xalz.service.ActivityMemberService;
import com.xalz.service.ActivityService;
import com.xalz.service.CommentService;
import com.xalz.service.FavoriteInfoService;
import com.xalz.service.UserService;
import com.xalz.tool.ImageUtils;

import tk.mybatis.mapper.entity.Example;

/**
 * 活动控制类
 * @author po
 *
 */
@Controller
public class ActivityController {
	
	//活动操作类
	@Autowired
	ActivityService activityService;
	
	//活动成员信息操作类
	@Autowired
	ActivityMemberService activityMemberService;
	
	//活动点赞操作类
	@Autowired
	FavoriteInfoService favoriteInfoService;
	
	//评论操作类
	@Autowired
	CommentService commentService;
	
	//用户操作类
	@Autowired
	UserService userService;
	
	//点赞
	@Autowired
	FavoriteInfoService foriteInfoService;
	
	/**
	 * 获取我正在进行的全部活动
	 * @return
	 */
	@RequestMapping("/myAttendingActiv")
	public String myAttendingActiv(HttpSession session) {
		User user =  (User) session.getAttribute("user");
		userService.getAllAUMPgByUserId(user.getUserId());
		return null;
	}
	
	/**
	 * 获取我发起的活动
	 * @return
	 */
	@RequestMapping("/myLaunchedActiv")
	public String myLaunchedActiv(HttpSession session) {
		User user =  (User) session.getAttribute("user");
		userService.getLaunchAUMPgByUserId(user.getUserId());
		return null;
	}
	
	
	/**
	 * 获取我评论过的活动
	 * @param session
	 * @return
	 */
	@RequestMapping("/myCommentedActiv")
	public String myCommentedActiv(HttpSession session) {
		User user =  (User) session.getAttribute("user");
		userService.getCmtAUMPdByUserId(user.getUserId());
		return "";
	}
	
	/**
	 * 获取我点赞过的活动
	 * @param session
	 * @return
	 */
	@RequestMapping("/myFavoriteActiv")
	public String myFavoriteActiv(HttpSession session) {
		User user =  (User) session.getAttribute("user");
		userService.getFavorAUMPdByUserId(user.getUserId());
		return "";
	}
	
	/**
	 * 我参加过的活动
	 * @return
	 */
	@RequestMapping("/myAttendedActiv")
	public String myAttendedActiv(HttpSession session) {
		User user =  (User) session.getAttribute("user");
		userService.getAttendedAUMPdByUserId(user.getUserId());
		return null;
	}
	
	
	
	/**
	 * 添加活动
	 * @param activity
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "/addActiv", method = RequestMethod.POST)
	public String addActivity(Activity activity,HttpServletRequest request,Model model) throws IOException {
		System.out.println(activity);
		activity.setUserId(1);
		String activBill = ImageUtils.upload(request, activity.getFile());
		activity.setActivBill(activBill);
		activityService.createActiv(activity);
		return "index";
	}
	
	
	/**
	 * 首页查询活动
	 * @param map
	 * @return
	 */
	@RequestMapping("/index/search")
	public String getActivByName(Map<String, Object> map){
//		activityService.getActivListByFuzzySearch(activity);
//		map.put("activities", activityService.getActivListByExample(example));
		return "index";
	}
	
	/**
	 * 根据活动id查看活动详细内容
	 * @param activId
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/index/{id}",method=RequestMethod.GET)
	public String getActivByActivId(@PathVariable("id") Integer activId,Map<String, Object> map) {
		//1、根据activId获取活动信息
		Map<Activity, List<User>> maps = activityService.getActivAndRecomment(activId);
		System.out.println(maps);
//		Activity activity = (Activity) maps.get(activityService.getActivByPrimaryKey(activId));
//		Activity activity = activityService.getActivByPrimaryKey(activId);
		
//		System.out.println(activity);
		List<User> users = activityMemberService.getUserListByActivity(activId);
		//2、获取活动参加人数
//		activityMemberService.
		//3、根据activId获取评论信息
		//设置活动id
		Comment comment = new Comment();
		comment.setActivId(activId);
//		List<UserAndComment> comments = commentService.getUserCommentByActivId(comment);
		//4、
		//放入map中
//		map.put("activity", activity);
		map.put("maps",maps);
//		map.put("comments",comments);
		return "activSpecificInfo";
	
	}
	
	@RequestMapping("/favoriteActiv")
	public String favoriteActiv(FavoriteInfo favoriteInfo) {
		//添加点赞信息
//		favoriteInfoService.addFavoriteInfo(favoriteInfo);
		return null;
	}
	
	/**
	 * 获取所有活动：未登录
	 * @param map
	 * @return
	 */
	@RequestMapping("/index")
	public String getAllActiv(Map<String, Object> map) {
		System.out.println(activityService.getAllActiv());
		map.put("activities", activityService.getAllActiv());
	  return "index";
	}
	
	/**
	 * 获取所有活动：已登录
	 * @param map
	 * @return
	 */
	@RequestMapping("/userIndex")
	public String getAllActivByUser(Map<String, Object> map) {
		System.out.println(activityService.getAllActiv());
		map.put("activities", activityService.getAllActiv());
	  return "index";
	}
	
	
	
	
}
