package com.xalz.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xalz.bean.Message;
import com.xalz.bean.User;
import com.xalz.service.MessageService;

/**
 * 用户消息
 * @author po
 *
 */
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
	public String getMessage(HttpSession session,Map<String,Object> map) {
		User user = (User) session.getAttribute("user");
		Integer userId = user.getUserId();
		//根据用户编号获取用户消息
		List<Message> messages = messageService.getMessageListByUserId(userId);
		map.put("messages", messages);
		return "myMessage";
	}
	
	/**
	 * 删除消息
	 * @param session
	 * @return
	 */
	@RequestMapping("/delMessage/{id}")
	public String delMessage(@PathVariable("id") Integer msgId,HttpSession session) {
		messageService.deleteMessageByPrimaryKey(msgId);
		return "redirect:/myMessage";
	}
	
	
}
