package com.xalz.mappers;

import org.springframework.stereotype.Component;

import com.xalz.bean.Comment;
import tk.mybatis.mapper.common.Mapper;

@Component
public interface CommentMapper extends Mapper<Comment> {
}