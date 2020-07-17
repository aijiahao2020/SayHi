package com.xalz.mappers;

import org.springframework.stereotype.Component;

import com.xalz.bean.User;
import tk.mybatis.mapper.common.Mapper;

@Component
public interface UserMapper extends Mapper<User> {
}