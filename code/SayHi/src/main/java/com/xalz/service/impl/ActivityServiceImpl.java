package com.xalz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.Activity;
import com.xalz.mappers.ActivityMapper;
import com.xalz.service.ActivityService;

/**
 * 活动操作类
 * @author po
 *
 */
@Service("activityService")
public class ActivityServiceImpl implements ActivityService{
	
	@Autowired
	ActivityMapper activityMapper;
	
	/**
	 * 获取所有活动
	 */
	@Override
	public List<Activity> getAllActiv() {
		return activityMapper.selectAll();
	}
	
	
	
	
}
