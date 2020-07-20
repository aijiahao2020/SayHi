package com.xalz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xalz.bean.User;
import com.xalz.service.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	MessageService messageService;
	
	/**
	 * 获取用户的消息信息
	 * @param session
	 * @return
	 */
	@RequestMapping("/myMessage")
	public String getMessage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		Integer userId = user.getUserId();
		return "";
	}
	
	/**
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/myMessage")
	public String delMessage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		Integer userId = user.getUserId();
		return "";
	}
	
	
}
