package com.xalz.test;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xalz.bean.FavoriteInfo;
import com.xalz.service.FavoriteInfoService;

public class FavoriteInfoTest {

	/**
	 * FavoriteInfoService 测试
	 */
	public static void main(String[] args) {
		ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");
		FavoriteInfoService favoriteInfoService = context.getBean(FavoriteInfoService.class);
		
		/* 测试addFavoriteInfo(FavoriteInfo favoriteInfo) */
//		FavoriteInfo favoriteInfo = new FavoriteInfo(1,4);
//		System.out.println(favoriteInfoService.addFavoriteInfo(favoriteInfo));
		
		/* 测试deleteFavoriteInfo(FavoriteInfo favoriteInfo) */
//		FavoriteInfo favoriteInfo = new FavoriteInfo(1,4);
//		System.out.println(favoriteInfoService.deleteFavoriteInfo(favoriteInfo));
		
		/* 测试getAllFavoriteInfo(FavoriteInfo favoriteInfo) */
//		FavoriteInfo favoriteInfo = new FavoriteInfo(null,1);
//		List<FavoriteInfo> list = favoriteInfoService.getAllFavoriteInfo(favoriteInfo);
//		
//		for(FavoriteInfo favor : list) {
//			System.out.println(favor);
//		}
		/* 测试queryFavoriteInfo(FavoriteInfo favoriteInfo) */
//		FavoriteInfo favoriteInfo = new FavoriteInfo(1,8);
//		System.out.println(favoriteInfoService.queryFavoriteInfo(favoriteInfo));
		
		
		/* 测试getFavoriteInfoCount(FavoriteInfo favoriteInfo) */
//		FavoriteInfo favoriteInfo = new FavoriteInfo(null,1);
//		System.out.println(favoriteInfoService.getFavoriteInfoCount(favoriteInfo));
		
	}
}
