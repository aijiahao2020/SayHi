package com.xalz.service;

import java.util.List;

import com.xalz.bean.FavoriteInfo;

/**
 * 点赞信息表操作接口
 * @author po
 *
 */
public interface FavoriteInfoService {

	// 添加点赞信息 √ 
	public boolean addFavoriteInfo(Integer userId, Integer activId);
	
	//删除点赞信息 √
	public boolean deleteFavoriteInfo(Integer userId, Integer activId);
	
	//获取活动所有点赞信息 √
	public List<FavoriteInfo> getAllFavoriteInfo(FavoriteInfo favoriteInfo);
	
	//查询点赞信息是否存在 √(添加点赞信息前要进确认是否已存在点赞信息)
	public boolean queryFavoriteInfo(Integer userId, Integer activId);
	
}
