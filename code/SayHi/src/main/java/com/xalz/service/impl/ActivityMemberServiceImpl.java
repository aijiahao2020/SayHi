package com.xalz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.ActivityMember;
import com.xalz.mappers.ActivityMemberMapper;
import com.xalz.service.ActivityMemberService;

/**
 * 活动成员表操作实现类
 * @author aijiahao
 *
 */
@Service("activityMemberService")
public class ActivityMemberServiceImpl implements ActivityMemberService{

	@Autowired
	ActivityMemberMapper activityMemberMapper;
	/**
	 * 获取活动的所有成员
	 */
	@Override
	public List<ActivityMember> getAllActvityMember(ActivityMember activityMemeber) {
		return activityMemberMapper.select(activityMemeber);
	}

	/**
	 * 添加活动成员
	 */
	@Override
	public boolean addActvityMember(ActivityMember activityMemeber) {
		if(activityMemberMapper.insert(activityMemeber) == 1)
			return true;
			else return false;
	}

	/**
	 * 删除活动成员
	 */
	@Override
	public boolean deleteActvityMember(ActivityMember activityMemeber) {
		if(activityMemberMapper.delete(activityMemeber) != 0)
			return true;
			else return false;
	}

	/**
	 * 查询用户是否已经加入该活动
	 */
	@Override
	public boolean queryActvityMember(ActivityMember activityMemeber) {
		 if (activityMemberMapper.selectOne(activityMemeber) != null) {
	            return true;
	        } else return false;
	}

	/**
	 * 查询活动成员的数量
	 */
	@Override
	public Integer getActvityMemberCount(ActivityMember activityMemeber) {
		return activityMemberMapper.selectCount(activityMemeber);
	}

	
}
