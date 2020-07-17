package com.xalz.service;

import java.util.List;

import com.xalz.bean.Comment;

import tk.mybatis.mapper.entity.Example;

/**
 * 评论表操作接口
 * @author po
 *
 */
public interface CommentService {
	
	//添加评论
	public boolean addComment(Comment comment);
	
	//删除评论
	//public boolean deleteComment(Comment comment);
	
	//使用QBC查询评论
	//public List<Comment> getCommentListByExample(Example example);
	
	//根据条件获取评论
	//public List<Comment> getCommentListByEqual(Example example);
	
	
}
