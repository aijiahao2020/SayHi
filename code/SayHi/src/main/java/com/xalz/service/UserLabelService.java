package com.xalz.service;

import java.util.List;

import com.xalz.bean.UserLabel;

public interface UserLabelService {

	//添加用户标签√
	public boolean addUserLabel(UserLabel userLabel);

	//删除用户标签√
	public  boolean deleteUserLabel(UserLabel userLabel);
	
//	//更新用户标签√
//	public boolean updateUserLabel(UserLabel userLabel);
	
	//获取用户所有标签
	public List<UserLabel> getUserLabel(UserLabel userLabel);
	
	//查询该用户标签是否存在√
	public boolean queryUserLabel(UserLabel userLabel);
}
