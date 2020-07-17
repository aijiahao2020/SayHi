package com.xalz.service;

import com.xalz.bean.Comment;

/**
 * 评论表操作接口
 * @author po
 *
 */
public interface CommentService {
	
	//添加评论
	public boolean addComment(Comment comment);
	
	
	
}
