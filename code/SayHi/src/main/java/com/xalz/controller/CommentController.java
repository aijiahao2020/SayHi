package com.xalz.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.xalz.bean.Comment;
import com.xalz.bean.User;
import com.xalz.service.CommentService;

/**
 * 评论控制类
 * 
 * @author po
 *
 */
@Controller
public class CommentController {

	@Autowired
	CommentService commentService;

	/**
	 * 添加评论
	 * 
	 * @param comment
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/addComment",method = RequestMethod.POST)
	public String addComment(Comment comment,Map<String, Object> map) {
		// 添加评论更改
		if(comment.getUserId() == null) {
			map.put("message","未登录，请先登录");
		}else {
			commentService.addComment(comment);
		}
		return "redirect:/index/"+comment.getActivId();
	}

}
