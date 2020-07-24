package com.xalz.service.impl;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.Activity;
import com.xalz.bean.ActivityMember;
import com.xalz.bean.Message;
import com.xalz.bean.User;
import com.xalz.mappers.ActivityMemberMapper;
import com.xalz.service.ActivityMemberService;
import com.xalz.service.ActivityService;
import com.xalz.service.MessageService;

/**
 * 活动成员表操作实现类
 * @author aijiahao
 *
 */
@Service("activityMemberService")
public class ActivityMemberServiceImpl implements ActivityMemberService{

	@Autowired
	ActivityMemberMapper activityMemberMapper;
	
	@Autowired
	ActivityService activityService;
	
	@Autowired
	MessageService messageService;
	/**
	 * 获取活动的所有成员
	 */
	@Override
	public List<ActivityMember> getAllActvityMember(ActivityMember activityMember) {
		return activityMemberMapper.select(activityMember);
	}

	/**
	 * 添加活动成员
	 */
	@Override
	public boolean addActvityMember(Integer userId, Integer activId) {
		ActivityMember activityMember = new ActivityMember();
		activityMember.setActivId(activId);
		activityMember.setUserId(userId);
		if (activityMemberMapper.selectOne(activityMember) != null) {
			return false;
		}else {
			if(activityMemberMapper.insert(activityMember) == 1) {
//				String messInfo = "加入成功提醒: 您成功加入《";
//				Activity activity = activityService.getActivByPrimaryKey(activId);
//				messInfo = messInfo + activity.getActivName() + "》,开始时间为:";
//				messInfo = messInfo + activity.getActivStarttime() + "，希望你及时到场.";
//				Message message = new Message();
//				message.setMessTime(new Date());
//				message.setUserId(userId);
//				message.setMessInfo(messInfo);
//				messageService.createMessage(message);
				return true;
			}else return false;
		}
		
	}

	/**
	 * 删除活动成员
	 */
	@Override
	public boolean deleteActvityMember(ActivityMember activityMember) {
		//通过用户编号和活动编号删除活动成员
		Activity activity = activityService.getActivByPrimaryKey(activityMember.getActivId());
		if(activity.getUserId() == activityMember.getUserId()) {
			return false;
		}else {
			if(activityMemberMapper.delete(activityMember) != 0)
				return true;
				else return false;
		}
	}

	/**
	 * 查询用户是否已经加入该活动
	 */
	@Override
	public boolean queryActvityMember(Integer userId, Integer activId) {
		ActivityMember activityMember = new ActivityMember();
		activityMember.setActivId(activId);
		activityMember.setUserId(userId);
		if (activityMemberMapper.selectOne(activityMember) != null) {
	           return true;
	       } else return false;
	}

	/**
	 * 通过活动编号查询活动成员的数量
	 */
	@Override
	public Integer getActvityMemberCount(Integer activId) {
		ActivityMember activityMember = new ActivityMember();
		activityMember.setActivId(activId);
		return activityMemberMapper.selectCount(activityMember);
	}
	
	/**
	 * 通过活动编号查询所有参加该活动的详细信息并将发起者排第一个
	 */
	
	@Override
	public List<User> getUserListByActivity(Integer activId) {
		//通过用户编号删除活动成员
		List<User> userList = activityMemberMapper.selectUserListByActivity(activId);
		Activity activity = activityMemberMapper.selectUserIdByActivId(activId);
		Integer userId = activity.getUserId();
		int i = 0;
		for(User user : userList) {
			if(user.getUserId() == userId && i == 0) {
				break;
			}
			if(user.getUserId() == userId && i != 0)
			{
				Collections.swap(userList, i, 0);
				break;
			}
			i++;
		}
		return userList;
	}

	
}
