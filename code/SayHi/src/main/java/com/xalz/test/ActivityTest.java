package com.xalz.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xalz.bean.Activity;
import com.xalz.service.ActivityService;



public class ActivityTest {
	
	/**
	 * ActivityService 测试
	 * @throws ParseException 
	 */
	public static void main(String[] args) throws ParseException {
		ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");

		ActivityService activityService = context.getBean(ActivityService.class);

/* 测试getAllActiv() */		
//		List<Activity> list = activityService.getAllActiv(); 
//		for(Activity activ : list) {
//			System.out.println(activ);
//		}
		
		
/* 测试createActiv(Activity activity) */		
//		Activity activity = new Activity(null, 1, null, "活动省份", "活动城市", "活动地点", new Date(), new Date(), "活动简介", "动漫", 30, null, null, null, null);
//		System.out.println(activityService.createActiv(activity));
		
/* 测试updateActiv(Activity activity) */	
//		Activity activity = new Activity(17, "活动名称1", "活动省份1", "活动城市1", "活动地点1", new Date(), new Date(), "活动简介1", "动漫1", 30, "活动简介", null, 0, 1);
//		System.out.println(activityService.updateActivByPrimaryKey(activity));
		
		
/* 测试deleteActivByPrimaryKey(Integer activId) */	
//		System.out.println(activityService.deleteActivByPrimaryKey(18));
		
/* 测试getActivListByExample(Example example) */	
//		Example example = new Example(Activity.class);
//		
//		Criteria criteria1 = example.createCriteria();
//		//Criteria criteria2 = example.createCriteria();
//		Date date=new Date(); //取时间 
//		criteria1.andGreaterThan("activStarttime", date);
//		Calendar calendar = new GregorianCalendar(); 
//		calendar.setTime(date); 
//		calendar.add(calendar.DATE,1); //把日期往后增加一天,整数  往后推,负数往前移动 
//		date=calendar.getTime();
//		criteria1.andLessThan("activStarttime", date);
//		List<Activity> list = activityService.getActivListByExample(example);
//		for(Activity activ : list) {
//			System.out.println(activ);
//		}
		
/* 测试getActivByPrimaryKey(Integer activId) */	
//		System.out.println(activityService.getActivByPrimaryKey(17));
		
		/* 测试getActivListByEqual(Activity activity) */	
//		Activity activity = new Activity(null, null, null, null, null, null, null, null, "动漫", null, null, null, null, null);
//		List<Activity> list = activityService.getActivListByEqual(activity);
//		for(Activity activ : list) {
//			System.out.println(activ);
//		}
		
		/* 测试getActivListByFavoriteInfo() */	
//		List<Activity> list = activityService.getActivListByFavoriteInfo();
//		for(Activity activ : list) {
//			System.out.println(activ);
//		}
		
		/* 测试getActivListByCommentNumber() */	
//		List<Activity> list = activityService.getActivListByCommentNumber();
//		for(Activity activ : list) {
//			System.out.println(activ);
//		}
		
		/* 测试getActivListByFuzzySearch(Activity activity) */	
//		Activity activity = new Activity(null, null, "担当", "湖南", null, null, null, null, null, "体育", null, null, null, null, null);
//		Activity activity = new Activity(null, null, null, null, null, null, null, null, null, "体育", null, null, null, null, null);
//		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Date activStarttime = dateFormat.parse("2019-07-17 00:00:00");
//		Date activEndtime = dateFormat.parse("2020-07-18 00:00:00");
//		Activity activity = new Activity(null, null, null, null, null, null, activStarttime, null, null, null, null, null, null, null, null);
//		Activity activity = new Activity();
//		List<Activity> list = activityService.getActivListByFuzzySearch(activity);
		
//		activity.setActivStarttime(activStarttime);
//		
//		List<Activity> list = activityService.getActivListByComprehensive(activity);
//		
//		for(Activity activ : list) {
//			System.out.println(activ);
//		}
//		System.out.println();
//		List<Activity> list1 = activityService.getActivListByFavoriteInfo(activity);
//		
//		for(Activity activ : list1) {
//			System.out.println(activ);
//		}
		
		System.out.println(activityService.updateActivCmtSelfByPrimaryKey(9,1));
		System.out.println(activityService.updateActivFavorInfoSelfByPrimaryKey(9, 1));
		
		
		
	}
	


	
}
