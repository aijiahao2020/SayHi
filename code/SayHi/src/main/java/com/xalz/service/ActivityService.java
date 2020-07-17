package com.xalz.service;

import java.util.List;

import com.xalz.bean.Activity;

import tk.mybatis.mapper.entity.Example;


public interface ActivityService {
	
	
	/**
	 * 待解决问题:添加操作，当数据库字段为非空，而封装的实体对象的该属性设置为空时，
	 * Java Appliaction 会直接抛出异常，然后结束程序
	 * 
	 * @return
	 */
	
	//	获取所有活动 √
	public List<Activity> getAllActiv();
	
	// 创建一个新的活动 √ 
	public boolean createActiv(Activity activity);
	
	//更新活动的某些属性√ 
	public boolean updateActivByPrimaryKey(Activity activity);
	
	//根据主键删除某一活动√
	public boolean deleteActivByPrimaryKey(Integer activId);
	
	//使用QBC查询活动√
	public List<Activity> getActivListByExample(Example example);
	
	//根据主键查询一个活动√
	public Activity getActivByPrimaryKey(Integer activId);
	
	//根据精确条件获取活动集合√
	public List<Activity> getActivListByEqual(Activity activity);
	
}
