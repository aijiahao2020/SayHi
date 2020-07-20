package com.xalz.service;

import java.util.List;
import java.util.Map;

import com.xalz.bean.Activity;
import com.xalz.bean.User;

public interface UserService {
	
	//查询登录用户是否存在√
    public boolean queryUser(User user);
    
    //用户注册 √
    public boolean register(User user);
    
    //用户标签选择
    
    //根据主键获取用户和用户标签信息 
    public User getUserByPrimaryKey(Integer userId);
    
    //根据用户编号获取进行中用户所有活动√
    public Map<Activity, List<User>> getAllAUMPgByUserId(Integer userId);
    
    //根据用户编号获取进行中用户发起活动√
    public Map<Activity, List<User>> getLaunchAUMPgByUserId(Integer userId);
    
    //根据用户编号获取用户点赞过的历史活动√
    public Map<Activity, List<User>> getFavorAUMPdByUserId(Integer userId);
    
    //根据用户编号获取用户评论的历史活动√
    public Map<Activity, List<User>> getCmtAUMPdByUserId(Integer userId);
    
    //根据用户编号获取参加过得的历史活动√
    public Map<Activity, List<User>> getAttendedAUMPdByUserId(Integer userId);
    
    //获取所有用户列表
    public List<User> getAllUserList();
    
    
}
