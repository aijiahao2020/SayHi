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
	public boolean addFavoriteInfo(FavoriteInfo favoriteInfo);
	
	//删除点赞信息 √
	public boolean deleteFavoriteInfo(FavoriteInfo favoriteInfo);
	
	//获取活动所有点赞信息 √
	public List<FavoriteInfo> getAllFavoriteInfo(FavoriteInfo favoriteInfo);
	
	//查询点赞信息是否存在 √(添加点赞信息前要进确认是否已存在点赞信息)
	public boolean queryFavoriteInfo(FavoriteInfo favoriteInfo);
	
	//获取活动点赞信息的数量 √(获取当前活动的点赞数)
	public Integer getFavoriteInfoCount(FavoriteInfo favoriteInfo);
}
