package com.xalz.service.impl;


import javax.lang.model.element.Element;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.Comment;
import com.xalz.mappers.CommentMapper;
import com.xalz.service.CommentService;

/**
 * 评论操作类
 * @author po
 *
 */
@Service("commentService")
public class CommentServiceimpl implements CommentService{
	
	@Autowired
	CommentMapper commentMapper;
	
	/**
	 * 添加评论
	 */
	@Override
	public boolean addComment(Comment comment) {
		if(commentMapper.insert(comment) == 1)
		return true;
		else return false;
	}
	
	
	
}
