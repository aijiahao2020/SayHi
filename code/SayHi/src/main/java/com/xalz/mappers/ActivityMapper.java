package com.xalz.mappers;

import org.springframework.stereotype.Component;

import com.xalz.bean.Activity;
import tk.mybatis.mapper.common.Mapper;

@Component
public interface ActivityMapper extends Mapper<Activity> {
}