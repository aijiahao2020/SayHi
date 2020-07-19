package com.xalz.service;

import java.util.List;

import com.xalz.bean.User;

public interface UserService {
	
	//查询登录用户是否存在√
    public boolean queryUser(User user);
    
    //用户注册 √
    public boolean register(User user);
    
    //用户标签选择
    
    //根据主键获取用户信息 √
    public User getUserByPrimaryKey(Integer user_id);
    
    //获取所有用户列表
    public List<User> getAllUserList();
    
    
}
