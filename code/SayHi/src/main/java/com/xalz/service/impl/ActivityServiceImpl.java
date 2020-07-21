package com.xalz.service.impl;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
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
	 * 通过活动名和地点进行活动查询
	 */
	/**
	 * Map<Activity, List<User>> maps = getActivMapByNameAddress();
	 * map.put("activs",maps);
	 * ${activs.getkey().sss}
	 */
	@Override
	public Map<Activity, List<User>> getActivMapByNameAddress(String activName, String address) {
		Activity activ = new Activity();
		activ.setActivName(activName);
		String activState = "";
		String activCity = "";
		if(!address.isEmpty()) {
			if(address.indexOf("省") == -1) {
				activState = address.substring(0, address.indexOf("市") + 1);
				address = address.substring(address.indexOf("市") + 1, address.length());
				activCity = address.substring(0, address.indexOf("区") + 1);
			}else {
				activState = address.substring(0, address.indexOf("省") + 1);
				address = address.substring(address.indexOf("省") + 1, address.length());
				activCity = address.substring(0, address.indexOf("市") + 1);
			}
		}
//		System.out.println(activState + ":" + activCity);
		activ.setActivState(activState);
		activ.setActivCity(activCity);
		activ.setActivStarttime(new Date());
		return getActivUserMap(activ);
	}
	
	/**
	 * 通过活动id获取该活动以及相关推荐
	 */
	@Override
	public Map<Activity, List<User>> getActivAndRecomment(Integer activId) {
		//通过活动id获取对应的活动
		Activity activity = activityMapper.selectByPrimaryKey(activId);
		//创建存放数据的LinkedHashMap
		Map<Activity, List<User>> activUserMap = new LinkedHashMap<Activity, List<User>>();
		//获取查询活动对应的用户成员列表
		List<User> userMember = activityMemberService.getUserListByActivity(activId);
		//将该活动的所有信息放入Map
		activUserMap.put(activity, userMember);
		//设置类似推荐的搜索条件
		Activity activRecoment = new Activity();
//		activRecoment.setActivState(activity.getActivState());
//		activRecoment.setActivCity(activity.getActivCity());
		activRecoment.setActivLabel(activity.getActivLabel());
		activRecoment.setActivStarttime(new Date());
		
		List<Activity> activList = getActivListByFuzzySearch(activRecoment);
		for(Activity activ : activList) {
			if(activ.getActivId() != activity.getActivId()) {
				List<User> userList = activityMemberService.getUserListByActivity(activ.getActivId());
				activUserMap.put(activ, userList);
			}
		}
		return activUserMap;
	}
	
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
		activity.setCmtNum(0);
		activity.setFavorNum(0);
		if(activity.getLimitExplain() == null) {
			activity.setLimitExplain("暂无限制");
		}
//		if(activity.getActivBill() == null) {
//			activity.setActivBill(image);
//		}
		if (activityMapper.insert(activity) == 1) {
			Activity activ = activityMapper.selectOne(activity);
			if(activityMemberService.addActvityMember(activ.getUserId(), activ.getActivId())) {
				return true;
			}
			return false;
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
		//设置查询的及结果按照活动开始时间升序排列
		example.setOrderByClause("activ_starttime DESC");
		Criteria criteria = example.createCriteria();
		if(activity != null) {
			if(activity.getUserId() != null) {
				criteria.andCondition("user_id=" +  activity.getUserId());
			}
			if(activity.getActivName() != null && activity.getActivName().length() > 0) {//设置活动名查询条件
				criteria.andLike("activName", "%" + activity.getActivName() + "%");
			}
			if(activity.getActivLabel() != null && activity.getActivLabel().length() > 0) {//设置活动标签查询条件
				criteria.andLike("activLabel", "%" + activity.getActivLabel() + "%");
			}
			if(activity.getActivState() != null && activity.getActivState().length() > 0) {//设置活动省份查询条件
				criteria.andLike("activState", "%" + activity.getActivState() + "%");
			}
			if(activity.getActivCity() != null && activity.getActivCity().length() > 0) {//设置活动省份查询条件
				criteria.andLike("activCity", "%" + activity.getActivCity() + "%");
			}
			if(activity.getActivStarttime() != null && activity.getActivEndtime() != null) {//设置活动开始时间查询条件
//				Calendar calendar = new GregorianCalendar(); 
//				calendar.setTime(activity.getActivStarttime());
				//传入的开始时间与结束时间为区间，查找开始时间在这个区间的活动
				criteria.andBetween("activStarttime", activity.getActivStarttime(), activity.getActivEndtime());
			}else if(activity.getActivStarttime() != null && activity.getActivEndtime() == null) {
				
//				criteria.andGreaterThan("activStarttime", activity.getActivStarttime());
//				criteria.andLessThan("activEndtime", activity.getActivStarttime());
				
				//查询进行中的活动
				//criteria.andLessThan("activStarttime", activity.getActivStarttime());
				criteria.andGreaterThan("activEndtime", activity.getActivStarttime());
			}
		}
		
		return activityMapper.selectByExample(example);
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
		Map<Activity, List<User>> activUserMap = new LinkedHashMap<Activity, List<User>>();
		for(Activity activ : activList) {
			List<User> userList = activityMemberService.getUserListByActivity(activ.getActivId());
			activUserMap.put(activ, userList);
		}
		return activUserMap;
	}

	/**
	 * 通过主键和时间进行条件查询
	 */
	@Override
	public Activity getActivListByPKAndTime(Activity activity) {
		Example example = new Example(Activity.class);
		//设置查询的及结果按照活动开始时间升序排列
		example.setOrderByClause("activ_starttime ASC");
		Criteria criteria = example.createCriteria();
		if(activity != null) {
			if(activity.getActivId() != null) {
				criteria.andCondition("activ_id=" +  activity.getActivId());
			}
			if(activity.getActivStarttime() != null && activity.getActivEndtime() == null) {
				//查询活动 当前时间 < 结束时间  进行中的活动
//				criteria.andLessThan("activStarttime", activity.getActivStarttime());
				criteria.andGreaterThan("activEndtime", activity.getActivStarttime());
			}else if(activity.getActivStarttime() == null && activity.getActivEndtime() != null) {
				//查询活动 当前时间 < 结束时间  历史活动
				criteria.andLessThan("activEndtime", activity.getActivEndtime());
			}
		}
		return activityMapper.selectOneByExample(example);
	}

	
	
}
