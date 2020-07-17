package com.xalz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.User;
import com.xalz.mappers.UserMapper;
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
		System.out.println(userMapper.insert(user));
		if (userMapper.insert(user) == 1) {
			return true;
		}else return false;
	}
	
	
	
}

