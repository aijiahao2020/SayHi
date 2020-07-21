package com.xalz.mappers;

import org.springframework.stereotype.Component;

import com.xalz.bean.Message;
import tk.mybatis.mapper.common.Mapper;

@Component
public interface MessageMapper extends Mapper<Message> {
}