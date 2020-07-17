package com.xalz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.mappers.UserLabelMapper;
import com.xalz.service.UserLabelService;

/**
 * 用户标签类
 * @author aijiahao
 *
 */
@Service("userLabelService")
public class UserLabelServiceImpl implements UserLabelService {
	
	//用户标签 dao
	@Autowired
	UserLabelMapper userLabelMapper;

}
