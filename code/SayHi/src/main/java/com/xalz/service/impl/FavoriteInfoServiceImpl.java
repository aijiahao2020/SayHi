package com.xalz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.FavoriteInfo;
import com.xalz.mappers.FavoriteInfoMapper;
import com.xalz.service.FavoriteInfoService;

/**
 * 点赞信息表操作实现类
 * @author aijiahao
 *
 */
@Service("favoriteInfoService")
public class FavoriteInfoServiceImpl implements FavoriteInfoService{
	
	//点赞信息 dao
    @Autowired
    FavoriteInfoMapper favoriteInfoMapper;
    
    /**
	 * 添加点赞信息
	 */
	@Override
	public boolean addFavoriteInfo(FavoriteInfo favoriteInfo) {
		if(favoriteInfoMapper.insert(favoriteInfo) == 1)
			return true;
			else return false;
	}

	/**
	 * 删除点赞信息
	 */
	@Override
	public boolean deleteFavoriteInfo(FavoriteInfo favoriteInfo) {
		if(favoriteInfoMapper.delete(favoriteInfo) != 0)
			return true;
			else return false;
	}

	/**
	 * 获取活动所有点赞信息
	 */
	@Override
	public List<FavoriteInfo> getAllFavoriteInfo(FavoriteInfo favoriteInfo) {
		return favoriteInfoMapper.select(favoriteInfo);
	}

	/**
	 * 查询点赞信息是否存在
	 */
	@Override
	public boolean queryFavoriteInfo(FavoriteInfo favoriteInfo) {
		if (favoriteInfoMapper.selectOne(favoriteInfo) != null) {
            return true;
        } else return false;
	}

	/**
	 * 获取活动点赞信息的数量
	 */
	@Override
	public Integer getFavoriteInfoCount(FavoriteInfo favoriteInfo) {
		return favoriteInfoMapper.selectCount(favoriteInfo);
	}
    
    
}
