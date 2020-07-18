package com.xalz.service;

import java.util.List;

import com.xalz.bean.ActivityMember;


public interface ActivityMemberService {
	
	// 获取活动的所有成员√ (获取活动成员或用户参加的活动)
	public List<ActivityMember> getAllActvityMember(ActivityMember activityMemeber);
	
	// 添加活动成员√ (添加前需要查询用户是否已经存在，否则会重复添加)
	public boolean addActvityMember(ActivityMember activityMemeber);
	
	// 删除活动成员√
	public boolean deleteActvityMember(ActivityMember activityMemeber);
	
	// 查询用户是否已经加入该活动 √ (防止用户重复加入)
	public boolean queryActvityMember(ActivityMember activityMemeber);
	
	//查询活动成员的数量√
	public Integer getActvityMemberCount(ActivityMember activityMemeber);
}
