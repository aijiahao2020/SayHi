package com.xalz.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xalz.bean.Activity;
import com.xalz.bean.Comment;
import com.xalz.bean.User;
import com.xalz.service.ActivityMemberService;
import com.xalz.service.ActivityService;
import com.xalz.service.CommentService;
import com.xalz.service.FavoriteInfoService;
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
	
	/**
	 * 获取我点赞过的活动
	 * @param session
	 * @return
	 */
	@RequestMapping("/myFavoriteActiv")
	public String myFavoriteActiv(HttpSession session) {
		User user =  (User) session.getAttribute("user");
//		favoriteInfoService.
		return null;
	}
	
	/**
	 * 我参加过的活动
	 * @return
	 */
	@RequestMapping("/myAttendedActiv")
	public String myAttendedActiv(HttpSession session) {
		User user =  (User) session.getAttribute("user");
//		activityMemberService
		return null;
	}
	
	/**
	 * 获取我发起的活动
	 * @return
	 */
	@RequestMapping("/myLaunchedActiv")
	public String myLaunchedActiv(HttpSession session) {
		User user =  (User) session.getAttribute("user");
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
	@RequestMapping(value = "/index/addActiv", method = RequestMethod.POST)
	public String addActivity(@ModelAttribute Activity activity,HttpServletRequest request,Model model) throws IOException {
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
		Example example = new Example(Activity.class);
//		map.put("activities", activityService.getActivListByExample(example));
		return "index";
	}
	
	@RequestMapping("/index/{id}")
	public String getActivByActivId(@PathVariable("id") Integer activId) {
		//1、根据activId获取活动信息
		Activity activity = activityService.getActivByPrimaryKey(activId);
		//2、根据activId获取评论信息
		Comment comment = new Comment();
		comment.setActivId(activId);
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
	
	@RequestMapping("/index/")
	public String getAllActivByUser(Map<String, Object> map) {
		System.out.println(activityService.getAllActiv());
		map.put("activities", activityService.getAllActiv());
	  return "index";
	}
	
	
	
	
}
