package com.xalz.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xalz.bean.Comment;
import com.xalz.service.CommentService;

public class CommentTest {
	
	public static void main(String[] args) {
		ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");
		
		CommentService commentService = context.getBean(CommentService.class);
		
		Comment comment = new Comment();
		
		comment.setCmtContent("2222");
		
		commentService.addComment(comment);
		
	}
	
}
