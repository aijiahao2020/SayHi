package com.xalz.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

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
		ActivityMember activityMemeber = new ActivityMember(activity.getUserId(), activity.getActivId());
		activityMemberService.addActvityMember(activityMemeber);
		activity.setCmtNum(0);
		activity.setFavorNum(0);
//		if(activity.getActivBill() != null) {
//			activity.setActivBill(image);
//		}
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
	public Map<Activity, List<User>> getActivListByCommentNumber(Activity activity) {
		Map<Activity, List<User>> activUserMap = getActivUserMap(activity);
		
		Set<Map.Entry<Activity, List<User>>> mapEntries = activUserMap.entrySet();    //获取map集合的所有键值对的Set集合（于Set集合中无序存放）
		List<Map.Entry<Activity,List<User>>> list = new ArrayList<Map.Entry<Activity,List<User>>>(mapEntries);
		Collections.sort(list, new Comparator<Map.Entry<Activity,List<User>>>() {

			@Override
			public int compare(Entry<Activity, List<User>> o1, Entry<Activity, List<User>> o2) {
				return o2.getKey().getCmtNum() - o1.getKey().getCmtNum();
			}
			
		});
		Map<Activity, List<User>> activUserMapByComNum = new LinkedHashMap<Activity, List<User>>();
		for(Map.Entry<Activity, List<User>> entry : list) {
			activUserMapByComNum.put(entry.getKey(), entry.getValue());
		}
		
		return activUserMapByComNum;
	}
	/**
	 * 通过点赞数进行排序
	 */
	@Override
	public Map<Activity, List<User>> getActivListByFavoriteInfo(Activity activity) {
		Map<Activity, List<User>> activUserMap = getActivUserMap(activity);
		
		Set<Map.Entry<Activity, List<User>>> mapEntries = activUserMap.entrySet();    //获取map集合的所有键值对的Set集合（于Set集合中无序存放）
		List<Map.Entry<Activity,List<User>>> list = new ArrayList<Map.Entry<Activity,List<User>>>(mapEntries);
		Collections.sort(list, new Comparator<Map.Entry<Activity,List<User>>>() {

			@Override
			public int compare(Entry<Activity, List<User>> o1, Entry<Activity, List<User>> o2) {
				return o2.getKey().getFavorNum() - o1.getKey().getFavorNum();
			}
			
		});
		Map<Activity, List<User>> activUserMapByFavorNum = new LinkedHashMap<Activity, List<User>>();
		for(Map.Entry<Activity, List<User>> entry : list) {
			activUserMapByFavorNum.put(entry.getKey(), entry.getValue());
		}
		return activUserMapByFavorNum;
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
	public Map<Activity, List<User>> getActivListByComprehensive(Activity activity) {
Map<Activity, List<User>> activUserMap = getActivUserMap(activity);
		
		Set<Map.Entry<Activity, List<User>>> mapEntries = activUserMap.entrySet();    //获取map集合的所有键值对的Set集合（于Set集合中无序存放）
		List<Map.Entry<Activity,List<User>>> list = new ArrayList<Map.Entry<Activity,List<User>>>(mapEntries);
		Collections.sort(list, new Comparator<Map.Entry<Activity,List<User>>>() {

			@Override
			public int compare(Entry<Activity, List<User>> o1, Entry<Activity, List<User>> o2) {
				return (o2.getKey().getCmtNum() + o2.getKey().getFavorNum()) - (o1.getKey().getCmtNum() + o1.getKey().getFavorNum());
			}
			
		});
		Map<Activity, List<User>> activUserMapByCphs = new LinkedHashMap<Activity, List<User>>();
		for(Map.Entry<Activity, List<User>> entry : list) {
			activUserMapByCphs.put(entry.getKey(), entry.getValue());
		}
		
		return activUserMapByCphs;
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
	 * 通过模糊查询获取活动和用户的map集合
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
