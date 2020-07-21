package com.xalz.service;

import java.util.List;
import java.util.Map;

import com.xalz.bean.Activity;
import com.xalz.bean.ActivityUser;
import com.xalz.bean.User;
import com.xalz.bean.UserLabel;

public interface UserService {
	
	//根据用户名和密码查询用户信息
	public User getUserByExample(User user);
	
	//更据用户编号更新用户信息
	public boolean updateUserByPrimaryKey(User user);
	
	//查询登录用户是否存在√
    public boolean queryUser(User user);
    
    //用户注册 √
    public boolean register(User user);
    
    //用户标签选择
    
    //根据主键获取用户和用户标签信息 
    public User getUserByPrimaryKey(Integer userId);
    
    
    //根据用户编号获取进行中用户所有活动√
    public List<ActivityUser> getAllAUMPgByUserId(Integer userId);
    
    //根据用户编号获取进行中用户发起活动
    public List<ActivityUser> getLaunchAUMPgByUserId(Integer userId);
    
    //根据用户编号获取用户点赞过的历史活动
    public List<ActivityUser> getFavorAUMPdByUserId(Integer userId);
    
    //根据用户编号获取用户评论的历史活动
    public List<ActivityUser> getCmtAUMPdByUserId(Integer userId);
    
    //根据用户编号获取参加过得的历史活动
    public List<ActivityUser> getAttendedAUMPdByUserId(Integer userId);
    
    //根据传来的用户对象和用户标签集合更新用户的信息
    public boolean updateUserInformation(User user, List<String> userLabelList);
    
    //获取所有用户列表
    public List<User> getAllUserList();
    
    
}
