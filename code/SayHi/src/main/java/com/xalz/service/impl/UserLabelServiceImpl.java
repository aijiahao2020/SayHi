package com.xalz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.UserLabel;
import com.xalz.mappers.UserLabelMapper;
import com.xalz.service.UserLabelService;

/**
 * 用户标签表操作实现类
 * @author aijiahao
 *
 */
@Service("userLabelService")
public class UserLabelServiceImpl implements UserLabelService {
	
	//用户标签 dao
	@Autowired
	UserLabelMapper userLabelMapper;

	/**
	 * 添加用户标签
	 */
	@Override
	public boolean addUserLabel(UserLabel userLabel) {
		if (userLabelMapper.insert(userLabel) != 0) {
            return true;
        } else return false;
	}

	/**
	 * 删除用户标签
	 */
	@Override
	public boolean deleteUserLabel(UserLabel userLabel) {
		if (userLabelMapper.delete(userLabel) != 0) {
            return true;
        } else return false;
	}

	/**
	 * 查询点赞信息是否存在
	 */
	@Override
	public List<UserLabel> getUserLabel(UserLabel userLabel) {
		return userLabelMapper.select(userLabel);
	}

	/**
	 * 查询该用户标签是否存在
	 */
	@Override
	public boolean queryUserLabel(UserLabel userLabel) {
		if (userLabelMapper.selectOne(userLabel) != null) {
            return true;
        } else return false;
	}
	
	

}
