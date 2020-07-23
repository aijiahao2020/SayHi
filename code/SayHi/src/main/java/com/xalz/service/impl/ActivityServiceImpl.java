package com.xalz.service.impl;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.Activity;
import com.xalz.bean.ActivityUser;
import com.xalz.bean.Message;
import com.xalz.bean.User;
import com.xalz.mappers.ActivityMapper;
import com.xalz.service.ActivityMemberService;
import com.xalz.service.ActivityService;
import com.xalz.service.MessageService;

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
	
	@Autowired
	MessageService messageService;
	

	/**
	 * 根据分类之下传来的字符串进行查询
	 */
	@Override
	public List<ActivityUser> getActivUserInClassify(String classifyString) {
		String activLabel = null;
		String activCity = null;
		String activStarttime = null;
		String condition = null;
		//获取分类之下传来的字符串并进行分割
		Activity activ = new Activity();
		String[] arr = classifyString.split("\\+");
		if(arr != null) {
			if(arr.length == 4) {
				//根据不同的字符串对活动属性进行赋值
				
				if(!arr[0].equals("全部")) {
					activLabel = arr[0];
					activ.setActivLabel(activLabel);
				}
				if(!arr[1].equals("全部")) {
					activCity = arr[1];
					activ.setActivCity(activCity);
				}
				
				if(arr[2].equals("今天")){
					Date nowDate = new Date();
					activ.setActivStarttime(nowDate);
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(nowDate);
					calendar.add(Calendar.DATE, 1);
					calendar.set(Calendar.HOUR_OF_DAY, 0);
					calendar.set(Calendar.MINUTE, 0);
					calendar.set(Calendar.SECOND, 0);
					activ.setActivEndtime(calendar.getTime());
					System.out.println(calendar.getTime());
				}else if(arr[2].equals("明天")){
					Date nowDate = new Date();
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(nowDate);
					calendar.add(Calendar.DATE, 1);
					calendar.set(Calendar.HOUR_OF_DAY, 0);
					calendar.set(Calendar.MINUTE, 0);
					calendar.set(Calendar.SECOND, 0);
					activ.setActivStarttime(calendar.getTime());
					calendar.add(Calendar.DATE, 1);
					activ.setActivEndtime(calendar.getTime());
				}else if(arr[2].equals("后天")){
					Date nowDate = new Date();
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(nowDate);
					calendar.add(Calendar.DATE, 2);
					calendar.set(Calendar.HOUR_OF_DAY, 0);
					calendar.set(Calendar.MINUTE, 0);
					calendar.set(Calendar.SECOND, 0);
					activ.setActivStarttime(calendar.getTime());
					calendar.add(Calendar.DATE, 1);
					activ.setActivEndtime(calendar.getTime());
				}else if(arr[2].equals("近一周")) {
					Date nowDate = new Date();
					activ.setActivStarttime(nowDate);
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(nowDate);
					calendar.add(Calendar.DATE, 7);
					calendar.set(Calendar.HOUR_OF_DAY, 0);
					calendar.set(Calendar.MINUTE, 0);
					calendar.set(Calendar.SECOND, 0);
					activ.setActivEndtime(calendar.getTime());
				}else if(arr[2].equals("其他")){
					Date nowDate = new Date();
					
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(nowDate);
					calendar.add(Calendar.DATE, 7);
					calendar.set(Calendar.HOUR_OF_DAY, 0);
					calendar.set(Calendar.MINUTE, 0);
					calendar.set(Calendar.SECOND, 0);
					activ.setActivStarttime(calendar.getTime());
				}else {
					activ.setActivStarttime(new Date());
				}
				condition = arr[3];
			}else {
				activ.setActivStarttime(new Date());
			}
		}
		if(condition.equals("讨论最多")) {
			return getActivUserListByCommentNumber(activ);
		}else if(condition.equals("点赞最多")){
			return getActivUserListByFavoriteInfo(activ);
		}else {
			return getActivUserListByComprehensive(activ);
		}
	}
	
	/**
	 * 首页活动推荐(结束时间大于当前时间,期望人数为满,点赞/评论综合推荐)
	 */
	@Override
	public List<ActivityUser> getActivUserIndexRecom() {
		Activity activity = new Activity();
		activity.getActivStarttime();
		return getActivUserListByComprehensive(activity);
	}


	/**
	 * 根据固定标签查询活动
	 */
	@Override
	public List<ActivityUser> getActivUserByActivLabel(String activLabel) {
		Activity activity = new Activity();
		activity.setActivLabel(activLabel);
		activity.setActivStarttime(new Date());
		return getActivUserListByComprehensive(activity);
	}
	
	/**
	 * 通过活动id获取该活动以及相关推荐
	 */
	public List<ActivityUser> getActivAndRecommentByActivId(Integer activId) {
		
		List<ActivityUser> activUserList = new LinkedList<ActivityUser>();
		//通过活动id获取对应的活动
		Activity activity = activityMapper.selectByPrimaryKey(activId);
		//获取查询活动对应的用户成员列表
		
		//设置类似推荐的搜索条件
		Activity activRecoment = new Activity();
//		activRecoment.setActivState(activity.getActivState());
//		activRecoment.setActivCity(activity.getActivCity());
		activRecoment.setActivLabel(activity.getActivLabel());
		activRecoment.setActivStarttime(new Date());
		
		List<Activity> activList = getActivListByFuzzySearch(activRecoment);
		for(Activity activ : activList) {
			if(activ.getActivId() != activity.getActivId()) {
				//通过活动编号查询活动对应的用户成员列表
				ActivityUser activUser = new ActivityUser();
				activUser.setActivId(activ.getActivId());
				activUser.setActivName(activ.getActivName());
				activUser.setActivStart(activ.getActivStarttime());
				activUser.setActivNum(activityMemberService.getActvityMemberCount(activ.getActivId()));
				activUser.setActivBill(activ.getActivBill());
				activUser.setUserList(activityMemberService.getUserListByActivity(activ.getActivId()));
				activUserList.add(activUser);
			}
		}
		
		return activUserList;
	}

	/**
	 * 通过活动名和地点进行活动查询
	 */
	/**
	 * Map<Activity, List<User>> maps = getActivMapByNameAddress();
	 * map.put("activs",maps);
	 * ${activs.getkey().sss}
	 */
	@Override
	public List<ActivityUser> getActivUserByNameAddress(String activName, String address) {
		Activity activ = new Activity();
		activ.setActivName(activName);
		String activState = null;
		String activCity = null;
		if(address != null) {
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
		List<Activity> activList = getActivListByFuzzySearch(activ);
		return convertActivListToActivUserList(activList);
	}
	
	
	
	/**
	 * 获取所有活动
	 */
	@Override
	public List<ActivityUser> getAllActiv() {
		return convertActivListToActivUserList(activityMapper.selectAll());
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
		Date date = new Date();
		//当期时间  > 活动结束时间 返回false
		if(date.after(activity.getActivStarttime())) {
			return false;
		}
		//活动结束时间 < 活动开始时间 返回false
		if(activity.getActivEndtime().before(activity.getActivStarttime())) {
			return false;
		}
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
		//通过活动编号获取活动参加者人数
		Integer activNum = activityMemberService.getActvityMemberCount(activity.getActivId());
		
		Date date = new Date();
		//当期时间  > 活动结束时间 返回false
		if(date.after(activity.getActivEndtime())) {
			return false;
		}
		//活动结束时间 < 活动开始时间 返回false
		if(activity.getActivEndtime().before(activity.getActivStarttime())) {
			return false;
		}
		
		//当前活动参加人数 > 活动期望人数 返回false
		if(activNum <= activity.getExpNum()) {
			if (activityMapper.updateByPrimaryKey(activity) == 1) {
				return true;
			}
			return false;
		}
		return false;
		
	}
	
	/**
	 * 根据主键删除某一活动
	 */
	@Override
	public boolean deleteActivByPrimaryKey(Integer activId) {
		List<User> userList = activityMemberService.getUserListByActivity(activId);
		Activity activity = activityMapper.selectByPrimaryKey(activId);
		for(User user : userList) {
			String messInfo = null;
			Message message = new Message();
			message.setUserId(user.getUserId());
			message.setMessTime(new Date());
			if(user.getUserId() == activity.getUserId()) {
				messInfo = "您" + messInfo + "创建的活动 《";
			}else {
				messInfo = "您" + messInfo + "参加的活动 《";
			}
			
			messInfo = messInfo + activity.getActivName() + "》已取消，特次提醒！";
			message.setMessInfo(messInfo);
			messageService.createMessage(message);
		}
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
	public List<ActivityUser> getActivUserListByCommentNumber(Activity activity) {
		//通过模糊查询获取符合条件的活动list集合
		List<Activity> activList = getActivListByFuzzySearch(activity);
		
		//对取出的活动根据评论数排序
		Collections.sort(activList, new Comparator<Activity>() {

			@Override
			public int compare(Activity o1, Activity o2) {
				// TODO Auto-generated method stub
				return o2.getCmtNum() - o1.getCmtNum();
			}
		});
		
		
		return convertActivListToActivUserList(activList);
	}
	/**
	 * 通过点赞数进行排序
	 */
	@Override
	public List<ActivityUser> getActivUserListByFavoriteInfo(Activity activity) {
		List<Activity> activList = getActivListByFuzzySearch(activity);
		
		//对取出的活动根据点赞数排序
		Collections.sort(activList, new Comparator<Activity>() {

			@Override
			public int compare(Activity o1, Activity o2) {
				// TODO Auto-generated method stub
				return o2.getFavorNum() - o1.getFavorNum();
			}
		});
		
		
		return convertActivListToActivUserList(activList);
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
//				criteria.orBetween("activEndtime", activity.getActivStarttime(), activity.getActivEndtime());
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
	
	/**
	 * 通过综合活动各属性进行查询
	 */
	@Override
	public List<ActivityUser> getActivUserListByComprehensive(Activity activity) {
		List<Activity> activList = getActivListByFuzzySearch(activity);
		
		//对取出的活动按照点赞、评论进行综合排序
		Collections.sort(activList, new Comparator<Activity>() {

			@Override
			public int compare(Activity o1, Activity o2) {
				// TODO Auto-generated method stub
				return (o2.getCmtNum() + o2.getFavorNum()) - (o1.getCmtNum() + o1.getFavorNum());
			}
		});
		
		
		return convertActivListToActivUserList(activList);
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
	 * 将
	 */
	public List<ActivityUser> convertActivListToActivUserList (List<Activity> activList) {
		//创建ActivityUser类的list集合
		List<ActivityUser> activUserList = new LinkedList<ActivityUser>();
		//遍历活动list
		for(Activity activ : activList) {
//				
				//通过活动编号查询活动对应的用户成员列表(过滤掉成员已满的)
			if(activityMemberService.getActvityMemberCount(activ.getActivId()) < activ.getExpNum()) {
				ActivityUser activUser = new ActivityUser();
				activUser.setActivId(activ.getActivId());
				activUser.setActivName(activ.getActivName());
				activUser.setActivStart(activ.getActivStarttime());
				//通过活动编号获取成员人数，赋值给ActivityUser对象的属性
				activUser.setActivNum(activityMemberService.getActvityMemberCount(activ.getActivId()));
				activUser.setActivBill(activ.getActivBill());
				//通过活动编号获取成员详细信息，赋值给ActivityUser对象的属性
				activUser.setUserList(activityMemberService.getUserListByActivity(activ.getActivId()));
				//将ActivityUser对象添加进list集合中
				activUserList.add(activUser);
			}
		}
		return activUserList;
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
