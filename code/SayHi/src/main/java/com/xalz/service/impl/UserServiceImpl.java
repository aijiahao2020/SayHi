package com.xalz.service.impl;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.Activity;
import com.xalz.bean.ActivityMember;
import com.xalz.bean.ActivityUser;
import com.xalz.bean.Comment;
import com.xalz.bean.FavoriteInfo;
import com.xalz.bean.Message;
import com.xalz.bean.User;
import com.xalz.bean.UserLabel;
import com.xalz.mappers.UserMapper;
import com.xalz.service.ActivityMemberService;
import com.xalz.service.ActivityService;
import com.xalz.service.CommentService;
import com.xalz.service.FavoriteInfoService;
import com.xalz.service.MessageService;
import com.xalz.service.UserService;

/**
 * 用户类
 * @author po
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService {
	
	//用户 dao
    @Autowired
    UserMapper userMapper;
    
    @Autowired
    ActivityService activityService;
    
    @Autowired
    ActivityMemberService activityMemberService;
    
    @Autowired
    FavoriteInfoService favoriteInfoService;
    
    @Autowired
    CommentService commentService;
    
    @Autowired
    MessageService messageService;
    
    
    /**
	 * 根据用户名和密码查询用户信息
	*/
	@Override
	public User getUserByExample(User user) {
		return userMapper.selectOne(user);
	}
	
	/*
     * 用户登录
     *
     */
    @Override
	public boolean updateUserByPrimaryKey(User user) {
		if (userMapper.updateByPrimaryKey(user) != 0) {
            return true;
        } else return false;
	}
    
	/**
     * 用户登录
     *
     * @param user
     * @return
     */
    public boolean queryUser(User user) {
        if (userMapper.selectOne(user) != null) {
            return true;
        } else return false;
    }
    
    /**
            * 注册
     */
	@Override
	public boolean register(User user) {
		if (userMapper.insert(user) == 1) {
			return true;
		}else return false;
//		int flag = 0;
//		try {
//			flag = userMapper.insert(user);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		if (flag == 1) {
//			return true;
//		}else return false;
		
	}

	/**
	 * 根据主键获取用户信息
	*/
	@Override
	public User getUserByPrimaryKey(Integer userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

	/**
	 * 获取所有用户列表
	*/
	@Override
	public List<User> getAllUserList() {
		return userMapper.selectAll();
	}

	/**
	 * 根据用户编号获取进行中用户所有活动
	*/
	@Override
	public List<ActivityUser> getAllAUMPgByUserId(Integer userId) {
		ActivityMember activityMember = new ActivityMember();
		Activity activ = new Activity();
		activityMember.setUserId(userId);
		Date date = new Date();
		//通过用户编号获取对应的活动成员List集合
		List<ActivityMember> activMemList = activityMemberService.getAllActvityMember(activityMember);
		List<Activity> activList = new LinkedList<Activity>();
		//根据活动编号获取对应的活动，并放入活动集合
		for(ActivityMember activMem : activMemList) {
			//设置活动的编号和开始时间，通过CQB查询唯一对应的活动
			activ.setActivId(activMem.getActivId());
			activ.setActivStarttime(date);
			Activity activKey = activityService.getActivListByPKAndTime(activ);
			
			//查询结果不为空，通过活动主键查询参加该活动的用户详细信息
			if(activKey != null) {
				activList.add(activKey);
			}
		}
		return activityService.convertActivListToActivUserList(activList);
	}

	/**
	 * 根据用户编号获取进行中用户发起活动
	*/
	@Override
	public List<ActivityUser> getLaunchAUMPgByUserId(Integer userId) {
		Activity activity = new Activity();
		activity.setUserId(userId);
		activity.setActivStarttime(new Date());
		//通过模糊查询获取活动集合
		List<Activity> activList =  activityService.getActivListByFuzzySearch(activity);
		return activityService.convertActivListToActivUserList(activList);
	}

	/**
	 * 根据用户编号获取用户点赞过的活动
	*/
	@Override
	public List<ActivityUser> getFavorAUMPdByUserId(Integer userId) {
		FavoriteInfo favorInfo = new FavoriteInfo();
		Activity activ = new Activity();
		favorInfo.setUserId(userId);
		Date date = new Date();
		//通过用户编号获取用户对应的所有点赞信息，进而获取对应的活动编号
		List<FavoriteInfo> favorInfoList = favoriteInfoService.getAllFavoriteInfo(favorInfo);
		
		List<Activity> activList = new LinkedList<Activity>();
		
		//根据活动编号获取对应的活动，并放入活动集合
		for(FavoriteInfo favor : favorInfoList) {
			//设置活动的编号和开始时间，通过CQB查询唯一对应的活动
//			activ.setActivId(favor.getActivId());
//			activ.setActivEndtime(date);
			Activity activKey = activityService.getActivByPrimaryKey(favor.getActivId());
			//查询结果不为空，通过活动主键查询参加该活动的用户详细信息
			if(activKey != null) {
				activList.add(activKey);
			}
			
		}
		return activityService.convertActivListToActivUserList(activList);
	}

	/**
	 * 根据用户编号获取用户过的评论的活动
	*/
	@Override
	public List<ActivityUser> getCmtAUMPdByUserId(Integer userId) {
		Comment comment  = new Comment();
		Activity activ = new Activity();
		comment.setUserId(userId);
		Date date = new Date();
		//通过用户编号获取用户对应的所有评论信息，进而获取对应的活动编号
		List<Comment> commentList = commentService.getCommentListByEqual(comment);
		
		List<Activity> activList = new LinkedList<Activity>();
		
		//根据活动编号获取对应的活动，并放入活动集合
		for(Comment com : commentList) {
			//设置活动的编号和开始时间，通过CQB查询唯一对应的活动
//			activ.setActivId(com.getActivId());
//			activ.setActivEndtime(date);
			Activity activKey = activityService.getActivByPrimaryKey(com.getActivId());
			//查询结果不为空，通过活动主键查询参加该活动的用户详细信息
			if(activKey != null) {
				activList.add(activKey);
			}
			
		}
		
		return activityService.convertActivListToActivUserList(activList);
	}

	/**
	 * 根据用户编号获取参加过得的历史活动
	*/
	@Override
	public List<ActivityUser> getAttendedAUMPdByUserId(Integer userId) {
		ActivityMember activityMember = new ActivityMember();
		Activity activ = new Activity();
		activityMember.setUserId(userId);
		Date date = new Date();
		//通过用户编号获取对应的活动成员List集合
		List<ActivityMember> activMemList = activityMemberService.getAllActvityMember(activityMember);
		
		List<Activity> activList = new LinkedList<Activity>();
		//根据活动编号获取对应的活动，并放入活动集合
		for(ActivityMember activMem : activMemList) {
			//设置活动的编号和开始时间，通过CQB查询唯一对应的活动
			activ.setActivId(activMem.getActivId());
//			activ.setActivEndtime(date);
			Activity activKey = activityService.getActivListByPKAndTime(activ);
			
			//查询结果不为空，通过活动主键查询参加该活动的用户详细信息
			if(activKey != null) {
				activList.add(activKey);
			}
		}
		return activityService.convertActivListToActivUserList(activList);
	}

	/**
	 * 根据用户编号获取参加过得的历史活动
	*/
	@Override
	public boolean updateUserInformation(User user, List<String> userLabelList) {
		// TODO Auto-generated method stub
		return false;
	}


	

	

}

