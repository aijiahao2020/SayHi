package com.xalz.service.impl;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.Activity;
import com.xalz.bean.ActivityMember;
import com.xalz.bean.Comment;
import com.xalz.bean.FavoriteInfo;
import com.xalz.bean.Message;
import com.xalz.bean.User;
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
	public Map<Activity, List<User>> getAllAUMPgByUserId(Integer userId) {
		ActivityMember activityMember = new ActivityMember();
		Activity activ = new Activity();
		activityMember.setUserId(userId);
		Date date = new Date();
		//声明返回的Map集合
		Map<Activity, List<User>> activUserMap = new LinkedHashMap<Activity, List<User>>();
		//通过用户编号获取对应的活动成员List集合
		List<ActivityMember> activMemList = activityMemberService.getAllActvityMember(activityMember);
		//遍历活动成员List集合
		for(ActivityMember activMem : activMemList) {
			//设置活动的编号和开始时间，通过CQB查询唯一对应的活动
			activ.setActivId(activMem.getActivId());
			activ.setActivStarttime(date);
			Activity activKey = activityService.getActivListByPKAndTime(activ);
			
			//查询结果不为空，通过活动主键查询参加该活动的用户详细信息
			if(activKey != null) {
				List<User> userList = activityMemberService.getUserListByActivity(activKey.getActivId());
				activUserMap.put(activKey, userList);
			}
		}
		return activUserMap;
	}

	/**
	 * 根据用户编号获取进行中用户发起活动
	*/
	@Override
	public Map<Activity, List<User>> getLaunchAUMPgByUserId(Integer userId) {
		Activity activity = new Activity();
		activity.setUserId(userId);
		activity.setActivStarttime(new Date());
		Map<Activity, List<User>> activUserMap =  activityService.getActivUserMap(activity);
		return activUserMap;
	}

	/**
	 * 根据用户编号获取用户点赞过的活动
	*/
	@Override
	public Map<Activity, List<User>> getFavorAUMPdByUserId(Integer userId) {
		FavoriteInfo favorInfo = new FavoriteInfo();
		Activity activ = new Activity();
		favorInfo.setUserId(userId);
		Date date = new Date();
		//声明返回的Map集合
		Map<Activity, List<User>> activUserMap = new LinkedHashMap<Activity, List<User>>();
		//通过用户编号获取用户对应的所有点赞信息，进而获取对应的活动编号
		List<FavoriteInfo> favorInfoList = favoriteInfoService.getAllFavoriteInfo(favorInfo);
		for(FavoriteInfo favor : favorInfoList) {
			//设置活动的编号和开始时间，通过CQB查询唯一对应的活动
			activ.setActivId(favor.getActivId());
//			activ.setActivEndtime(date);
			Activity activKey = activityService.getActivListByPKAndTime(activ);
			//查询结果不为空，通过活动主键查询参加该活动的用户详细信息
			if(activKey != null) {
				List<User> userList = activityMemberService.getUserListByActivity(activKey.getActivId());
				activUserMap.put(activKey, userList);
			}
			
		}
		return activUserMap;
	}

	/**
	 * 根据用户编号获取用户评论的活动
	*/
	@Override
	public Map<Activity, List<User>> getCmtAUMPdByUserId(Integer userId) {
		Comment comment  = new Comment();
		Activity activ = new Activity();
		comment.setUserId(userId);
		Date date = new Date();
		//声明返回的Map集合
		Map<Activity, List<User>> activUserMap = new LinkedHashMap<Activity, List<User>>();
		//通过用户编号获取用户对应的所有评论信息，进而获取对应的活动编号
		List<Comment> commentList = commentService.getCommentListByEqual(comment);
		
		for(Comment com : commentList) {
			//设置活动的编号和开始时间，通过CQB查询唯一对应的活动
			activ.setActivId(com.getActivId());
//			activ.setActivEndtime(date);
			Activity activKey = activityService.getActivListByPKAndTime(activ);
			//查询结果不为空，通过活动主键查询参加该活动的用户详细信息
			if(activKey != null) {
				List<User> userList = activityMemberService.getUserListByActivity(activKey.getActivId());
				activUserMap.put(activKey, userList);
			}
			
		}
		
		return activUserMap;
	}

	/**
	 * 根据用户编号获取参加过得的历史活动
	*/
	@Override
	public Map<Activity, List<User>> getAttendedAUMPdByUserId(Integer userId) {
		ActivityMember activityMember = new ActivityMember();
		Activity activ = new Activity();
		activityMember.setUserId(userId);
		Date date = new Date();
		//声明返回的Map集合
		Map<Activity, List<User>> activUserMap = new LinkedHashMap<Activity, List<User>>();
		//通过用户编号获取对应的活动成员List集合
		List<ActivityMember> activMemList = activityMemberService.getAllActvityMember(activityMember);
		//遍历活动成员List集合
		for(ActivityMember activMem : activMemList) {
			//设置活动的编号和开始时间，通过CQB查询唯一对应的活动
			activ.setActivId(activMem.getActivId());
//			activ.setActivEndtime(date);
			Activity activKey = activityService.getActivListByPKAndTime(activ);
			
			//查询结果不为空，通过活动主键查询参加该活动的用户详细信息
			if(activKey != null) {
				List<User> userList = activityMemberService.getUserListByActivity(activKey.getActivId());
				activUserMap.put(activKey, userList);
			}
		}
		return activUserMap;
	}

}

