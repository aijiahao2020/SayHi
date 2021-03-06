package com.xalz.service;

import java.util.List;
import java.util.Map;

import com.xalz.bean.Activity;
import com.xalz.bean.ActivityUser;
import com.xalz.bean.User;


public interface ActivityService {
	
	
	/**
	 * 待解决问题:添加操作，当数据库字段为非空，而封装的实体对象的该属性设置为空时，
	 * Java Appliaction 会直接抛出异常，然后结束程序
	 * 
	 * @return
	 */
	
	//查询该用户是否为该活动的主办方
	public boolean queryActivSponsor(Integer activId, Integer userId);

	
	//根据分类之下传来的字符串进行查询
	public List<ActivityUser> getActivUserInClassify(String classifyString);
		
	//首页活动推荐
	public List<ActivityUser> getActivUserIndexRecom();
	
	//根据固定标签查询活动√
	public List<ActivityUser> getActivUserByActivLabel(String activLabel);
	
	//通过活动id获取该活动以及相关推荐√
	public List<ActivityUser> getActivAndRecommentByActivId(Integer activId);
	
	//通过活动名和地点进行活动查询
	public List<ActivityUser> getActivUserByNameAddress(String activName, String address);
	
	//	获取所有活动 √
	public List<Activity> getAllActiv();
	
	// 创建一个新的活动 √ 
	public boolean createActiv(Activity activity);
	
	//更新活动的某些属性√ 
	public boolean updateActivByPrimaryKey(Activity activity);
	
	//根据主键删除某一活动√
	public boolean deleteActivByPrimaryKey(Integer activId);
	
	//通过主键和时间进行条件查询
	public Activity getActivListByPKAndTime(Activity activity);
	
	//根据主键查询一个活动√
	public Activity getActivByPrimaryKey(Integer activId);
	
	//根据精确条件获取活动集合√
	public List<Activity> getActivListByEqual(Activity activity);
	
	//通过评论数进行排序√
	public List<ActivityUser> getActivUserListByCommentNumber (Activity activity);
	
	//通过点赞数进行排序√
	public List<ActivityUser> getActivUserListByFavoriteInfo (Activity activity);
	
	//通过活动属性进行模糊查询√
	public List<Activity> getActivListByFuzzySearch(Activity activity);
	
	//通过综合活动各属性进行查询√
	public List<ActivityUser> getActivUserListByComprehensive(Activity activity);
	
	//通过发布时间进行查询
	
	//点赞数进行自增√
	public boolean updateActivCmtSelfByPrimaryKey(Integer activId, Integer operator);
	
	//点赞数进行自增√
	public boolean updateActivFavorInfoSelfByPrimaryKey(Integer activId, Integer operator);
	
	//通过查询获取活动和用户的map集合√
	public List<ActivityUser> convertActivListToActivUserList(List<Activity> activityList);
}
