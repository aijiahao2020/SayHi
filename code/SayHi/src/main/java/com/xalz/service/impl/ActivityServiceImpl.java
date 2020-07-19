package com.xalz.service.impl;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.Activity;
import com.xalz.bean.ActivityMember;
import com.xalz.bean.User;
import com.xalz.mappers.ActivityMapper;
import com.xalz.service.ActivityMemberService;
import com.xalz.service.ActivityService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

/**
 * 活动表操作实现类
 * @author po
 *
 */
@Service("activityService")
public class ActivityServiceImpl implements ActivityService{
	
	//活动 dao
	@Autowired
	ActivityMapper activityMapper;
	
	@Autowired
	ActivityMemberService activityMemberService;
	/**
	 * 获取所有活动
	 */
	@Override
	public List<Activity> getAllActiv() {
		return activityMapper.selectAll();
	}

	/**
	 * 创建一个活动
	 */
	@Override
	public boolean createActiv(Activity activity) {
		if (activityMapper.insert(activity) == 1) {
			return true;
		}else return false;
	}
	
	/**
	 * 更新活动的某些属性
	 */
	@Override
	public boolean updateActivByPrimaryKey(Activity activity) {
		if (activityMapper.updateByPrimaryKey(activity) == 1) {
			return true;
		}else return false;
	}
	
	/**
	 * 根据主键删除某一活动
	 */
	@Override
	public boolean deleteActivByPrimaryKey(Integer activId) {
		if (activityMapper.deleteByPrimaryKey(activId) == 1) {
			return true;
		}else return false;
	}
	
	/**
	 * 使用QBC查询活动
	 */
	@Override
	public List<Activity> getActivListByExample(Example example) {
		return activityMapper.selectByExample(example);
	}

	/**
	 * 根据精确条件获取活动集合
	 */
	@Override
	public List<Activity> getActivListByEqual(Activity activity) {
		return activityMapper.select(activity);
	}
	
	/**
	 * 根据主键查询一个活动
	 */
	@Override
	public Activity getActivByPrimaryKey(Integer activId) {
		return activityMapper.selectByPrimaryKey(activId);
	}

	/**
	 * 通过评论数进行排序
	 */
	@Override
	public List<Activity> getActivListByCommentNumber(Activity activity) {
		List<Activity> allActivSortByCmtNum = getActivListByFuzzySearch(activity);
		Collections.sort(allActivSortByCmtNum, new Comparator<Activity>() {

			@Override
			public int compare(Activity o1, Activity o2) {
				return o2.getCmtNum() - o1.getCmtNum();
			}
			
		});
		return allActivSortByCmtNum;
	}
	/**
	 * 通过点赞数进行排序
	 */
	@Override
	public List<Activity> getActivListByFavoriteInfo(Activity activity) {
		List<Activity> allActivSortByFavorNum = getActivListByFuzzySearch(activity);
		Collections.sort(allActivSortByFavorNum, new Comparator<Activity>() {

			@Override
			public int compare(Activity o1, Activity o2) {//降序
				return o2.getFavorNum() - o1.getFavorNum();
			}
			
		});
		return allActivSortByFavorNum;
	}

	/**
	 * 通过活动属性进行模糊查询
	 */
	@Override
	public List<Activity> getActivListByFuzzySearch(Activity activity) {
		Example example = new Example(Activity.class);
		Criteria criteria = example.createCriteria();
		if(activity != null) {
			if(activity.getActivName() != null && activity.getActivName().length() > 0) {
				criteria.andLike("activName", "%" + activity.getActivName() + "%");
			}
			if(activity.getActivLabel() != null && activity.getActivLabel().length() > 0) {
				criteria.andLike("activLabel", "%" + activity.getActivLabel() + "%");
			}
			if(activity.getActivState() != null && activity.getActivState().length() > 0) {
				criteria.andLike("activState", "%" + activity.getActivState() + "%");
			}
			if(activity.getActivStarttime() != null && activity.getActivEndtime() != null) {
//				Calendar calendar = new GregorianCalendar(); 
//				calendar.setTime(activity.getActivStarttime());
				criteria.andBetween("activStarttime", activity.getActivStarttime(), activity.getActivEndtime());
			}else if(activity.getActivStarttime() != null && activity.getActivEndtime() == null) {
				criteria.andGreaterThan("activStarttime", activity.getActivStarttime());
			}
		}
		return getActivListByExample(example);
	}
	
	
	@Override
	public List<Activity> getActivListByComprehensive(Activity activity) {
		List<Activity> allActivSortByComprehensive = getActivListByFuzzySearch(activity);
		Collections.sort(allActivSortByComprehensive, new Comparator<Activity>() {

			@Override
			public int compare(Activity o1, Activity o2) {//降序
				return (o2.getFavorNum() + o2.getCmtNum()) - (o1.getFavorNum() + o1.getCmtNum());
			}
			
		});
		return allActivSortByComprehensive;
	}

	/**
	 * 用户评论数增自减 operator 0 自减 非0自增
	 */
	@Override
	public boolean updateActivCmtSelfByPrimaryKey(Integer activId, Integer operator) {
		Activity activity = activityMapper.selectByPrimaryKey(activId);
		if(operator != 0) {
			activity.setCmtNum(activity.getCmtNum() + 1);
		}else {
			if(activity.getCmtNum() >= 1) {
				activity.setCmtNum(activity.getCmtNum() - 1);
			}
		}
		
		return updateActivByPrimaryKey(activity);
	}

	@Override
	public boolean updateActivFavorInfoSelfByPrimaryKey(Integer activId, Integer operator) {
		Activity activity = activityMapper.selectByPrimaryKey(activId);
		if(operator != 0) {
			activity.setFavorNum(activity.getFavorNum() + 1);
		}else {
			if(activity.getFavorNum() >= 1) {
				activity.setFavorNum(activity.getFavorNum() - 1);
			}
		}
		
		return updateActivByPrimaryKey(activity);
	}

	
	/**
	 * 通过查询获取活动和用户的map集合
	 */
	public Map<Activity, List<User>> getActivUserMap(Activity activity) {
		List<Activity> activList = getActivListByFuzzySearch(activity);
		ActivityMember activityMemeber = new ActivityMember();
		Map<Activity, List<User>> activUserMap = new HashMap<Activity, List<User>>();
		for(Activity activ : activList) {
			activityMemeber.setActivId(activ.getActivId());
			List<User> userList = activityMemberService.getUserListByActivity(activityMemeber);
			activUserMap.put(activ, userList);
		}
		return activUserMap;
	}

	
	
}
