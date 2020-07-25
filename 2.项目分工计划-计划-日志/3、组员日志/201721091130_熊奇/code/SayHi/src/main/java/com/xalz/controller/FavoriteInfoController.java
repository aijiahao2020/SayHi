package com.xalz.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xalz.bean.Activity;
import com.xalz.bean.User;
import com.xalz.service.ActivityService;
import com.xalz.service.FavoriteInfoService;

/**
 * 点赞功能
 * 
 * @author po
 *
 */
@Controller
public class FavoriteInfoController {

	@Autowired
	FavoriteInfoService favoriteInfoService;

	@Autowired
	ActivityService activityService;

	/**
	 * 点赞
	 * 
	 * @return
	 * @throws IOException
	 */

	@RequestMapping(value = "/addFavoriteInfo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addFavoriteInfo(@RequestParam("activId") Integer activId,@RequestParam("isFavor") String isFavor, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String result = null;
		System.out.println(isFavor + "ddddddddddd");
		//获取用户
		User user =  (User) request.getSession().getAttribute("user");
		if (user == null) {
			result = "请先登录，后点赞";
			return result;
		}
		if(isFavor.equals("点赞")) {
			//点赞addFavoriteInfo
			favoriteInfoService.addFavoriteInfo(user.getUserId(), activId);
			result =  "已点赞";
		}else {
			//点赞
			favoriteInfoService.deleteFavoriteInfo(user.getUserId(), activId);
			result = "点赞";
		}
//		result = activity.getFavorNum().toString();
//		request.setAttribute("isFavor", true);
		return result;
	}

	/**
	 * 取消点赞
	 * 
	 * @return
	 */
	@RequestMapping(value = "/delFavoriteInfo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delFavoriteInfo(@RequestParam(value = "activId") Integer activId, HttpServletRequest request) {
		System.out.println(activId + "d");
		String result = null;
		//获取用户
		User user =  (User) request.getSession().getAttribute("user");
		//点赞
		favoriteInfoService.deleteFavoriteInfo(user.getUserId(), activId);
		//获取点赞数
		Activity activity =  activityService.getActivByPrimaryKey(activId);
		result = activity.getFavorNum().toString();
//		request.setAttribute("isFavor", false);
		return result;
	}

}
