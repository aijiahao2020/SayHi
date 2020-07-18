package com.xalz.test;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xalz.bean.Comment;
import com.xalz.service.CommentService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

public class CommentTest {
	
	public static void main(String[] args) {
		ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");
		
		CommentService commentService = context.getBean(CommentService.class);
		
		
		/* 测试addComment(Comment comment) */
//		Comment comment = new Comment(null, 1, 3, new Date(), "憨批活动");
//		System.out.println(commentService.addComment(comment));
		
		/* 测试updateCommentByPrimaryKey(Comment comment) */
//		Comment comment = new Comment(27, 1, 3, new Date(), "憨批活动");
//		System.out.println(commentService.updateCommentByPrimaryKey(comment));
		
		/* 测试updateCommentByExample(Comment comment, Example example) */
//		Example example = new Example(Comment.class);
//		Criteria criteria1 = example.createCriteria();
//		Date date=new Date(); //取时间 
//		criteria1.andGreaterThan("cmtTime", date);
//		Calendar calendar = new GregorianCalendar(); 
//		calendar.setTime(date); 
//		calendar.add(calendar.DATE,1); //把日期往后增加一天,整数  往后推,负数往前移动 
//		date=calendar.getTime();
//		criteria1.andLessThan("cmtTime", date);
//		Comment comment = new Comment(null, null, null, null, "****");
//		System.out.println(commentService.updateCommentByExampleSelective(comment, example));
		
		/* 测试deleteComment(Comment comment) */
//		Comment comment = new Comment(null, null, null, null, "憨批");
//		System.out.println(commentService.deleteComment(comment));
		
		/* deleteCommentByPrimaryKey(Integer cmtId) */
//		System.out.println(commentService.deleteCommentByPrimaryKey(32));
		
		
		/* getCommentListByExample(Example example) */
//		Example example = new Example(Comment.class);
//		Criteria criteria1 = example.createCriteria();
//		Date date=new Date(); //取时间 
//		criteria1.andGreaterThan("cmtTime", date);
//		Calendar calendar = new GregorianCalendar(); 
//		calendar.setTime(date); 
//		calendar.add(calendar.DATE,1); //把日期往后增加一天,整数  往后推,负数往前移动 
//		date=calendar.getTime();
//		criteria1.andLessThan("cmtTime", date);
//		List<Comment> list = commentService.getCommentListByExample(example);
//		for(Comment comment : list) {
//			System.out.println(comment);
//		}
		
		/* getCommentListByExampleEqual(Example example) */
//		Comment comment = new Comment(null, null, 1, null, null);
//		List<Comment> list = commentService.getCommentListByEqual(comment);
//		for(Comment com : list) {
//			System.out.println(com);
//		}
		
		/* getActivCommentCount(Comment comment) */
		Comment comment = new Comment(null, 1, 1, null, null);
		System.out.println(commentService.getCommentCount(comment));
	}
	
}
