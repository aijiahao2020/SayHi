package com.xalz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xalz.bean.Comment;
import com.xalz.bean.User;
import com.xalz.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	/**
	 * 添加评论
	 * @param comment
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/addActiv")
	public String addComment(Comment comment,HttpSession session,HttpServletRequest request) {
		//获取user
		User user = (User) session.getAttribute("user");
		comment.setUserId(user.getUserId());
		//获取activId
		int activId = Integer.parseInt(request.getParameter("activId"));
		comment.setActivId(activId);
		//添加评论
		commentService.addComment(comment);
		return "";
	}
	
	
	
	
	
	
}
