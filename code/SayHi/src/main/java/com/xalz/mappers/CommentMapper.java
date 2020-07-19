package com.xalz.mappers;

import java.util.List;

import org.springframework.stereotype.Component;

import com.xalz.bean.Comment;
import com.xalz.bean.UserAndComment;

import tk.mybatis.mapper.common.Mapper;

@Component
public interface CommentMapper extends Mapper<Comment> {
	
	//通过活动编号获取活动的评论及用户
	public List<UserAndComment> selectUserCommentByActivId(Comment comment);
}