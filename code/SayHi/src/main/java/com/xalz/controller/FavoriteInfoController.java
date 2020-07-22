package com.xalz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xalz.bean.User;
import com.xalz.service.FavoriteInfoService;

/**
 * 点赞功能
 * @author po
 *
 */
@Controller
public class FavoriteInfoController {
	
	@Autowired
	FavoriteInfoService favoriteInfoService;
	
	/**
	 * 点赞
	 * @return
	 */
	@RequestMapping("/addFavoriteInfo")
	public String addFavoriteInfo(@RequestParam(value = "activId") Integer activId,HttpSession session) {
		User user = (User) session.getAttribute("user");
		favoriteInfoService.addFavoriteInfo(user.getUserId(), activId);
		return "";
	}
	
	/**
	 * 取消点赞
	 * @return
	 */
	@RequestMapping("/delFavoriteInfo")
	public String delFavoriteInfo(@RequestParam(value = "activId") Integer activId,HttpSession session) {
		User user = (User) session.getAttribute("user");
		favoriteInfoService.deleteFavoriteInfo(user.getUserId(),activId);
		return "";
	}
	
	
}
