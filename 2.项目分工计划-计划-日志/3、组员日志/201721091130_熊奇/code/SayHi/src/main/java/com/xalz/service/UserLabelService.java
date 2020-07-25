package com.xalz.service;

import java.util.List;
import java.util.Map;

import com.xalz.bean.User;
import com.xalz.bean.UserLabel;

public interface UserLabelService {

	//获取用户指定索引的标签
	public String queryUserLabelByUserId(Integer userId, Integer index);
	
	//通过用户编号更新用户标签
	public boolean updateUserLabelByUserId(Integer userId, List<String> labelList);
	
	//添加用户标签√
	public boolean addUserLabel(UserLabel userLabel);

	//删除用户标签√
	public  boolean deleteUserLabel(UserLabel userLabel);
	
	//获取用户所有标签
	public List<UserLabel> getUserLabel(UserLabel userLabel);
	
	//查询该用户标签是否存在√
	public boolean queryUserLabel(UserLabel userLabel);
	
	//通过用户编号查询用户详细信息和用户标签
	public List<UserLabel> getMyUserByUserId(Integer userId);
}
