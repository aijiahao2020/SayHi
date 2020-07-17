package com.xalz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.mappers.FavoriteInfoMapper;
import com.xalz.service.FavoriteInfoService;

/**
 * 点赞信息类
 * @author aijiahao
 *
 */
@Service("favoriteInfoService")
public class FavoriteInfoServiceImpl implements FavoriteInfoService{
	
	//点赞信息 dao
    @Autowired
    FavoriteInfoMapper favoriteInfoMapper;
}
