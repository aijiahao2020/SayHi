package com.xalz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.Activity;
import com.xalz.mappers.ActivityMapper;
import com.xalz.service.ActivityService;

import tk.mybatis.mapper.entity.Example;

/**
 * 活动操作类
 * @author po
 *
 */
@Service("activityService")
public class ActivityServiceImpl implements ActivityService{
	
	//活动 dao
	@Autowired
	ActivityMapper activityMapper;
	
	/**
	 * 获取所有活动
	 */
	@Override
	public List<Activity> getAllActiv() {
		return activityMapper.selectAll();
	}

	/**
	 * 创建一个活动
	 */
	@Override
	public boolean createActiv(Activity activity) {
		if (activityMapper.insert(activity) == 1) {
			return true;
		}else return false;
	}
	
	/**
	 * 更新活动的某些属性
	 */
	@Override
	public boolean updateActivByPrimaryKey(Activity activity) {
		if (activityMapper.updateByPrimaryKey(activity) == 1) {
			return true;
		}else return false;
	}
	
	/**
	 * 根据主键删除某一活动
	 */
	@Override
	public boolean deleteActivByPrimaryKey(Integer activId) {
		if (activityMapper.deleteByPrimaryKey(activId) == 1) {
			return true;
		}else return false;
	}
	
	/**
	 * 使用QBC查询活动
	 */
	@Override
	public List<Activity> getActivListByExample(Example example) {
		return activityMapper.selectByExample(example);
	}

	/**
	 * 根据精确条件获取活动集合
	 */
	@Override
	public List<Activity> getActivListByEqual(Activity activity) {
		return activityMapper.select(activity);
	}
	
	/**
	 * 根据主键查询一个活动
	 */
	@Override
	public Activity getActivByPrimaryKey(Integer activId) {
		return activityMapper.selectByPrimaryKey(activId);
	}

	
	
}
