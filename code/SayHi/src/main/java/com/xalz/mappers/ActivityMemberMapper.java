package com.xalz.mappers;

import java.util.List;

import com.xalz.bean.Activity;
import com.xalz.bean.ActivityMember;
import com.xalz.bean.User;

import tk.mybatis.mapper.common.Mapper;

public interface ActivityMemberMapper extends Mapper<ActivityMember> {
	//通过活动编号查询所有参加该活动用户的详细信息
	public List<User> selectUserListByActivity(Integer activId);
		
	//通过活动编号查询发起活动者的用户编号
	public Activity selectUserIdByActivId(Integer activId);
	
	//通过用户编号查询用户参加的活动
//	public List<Activity> selectActivIdByUserId(Integer userId);
}