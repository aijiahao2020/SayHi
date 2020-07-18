package com.xalz.test;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xalz.bean.ActivityMember;
import com.xalz.service.ActivityMemberService;

public class ActivityMemberTest {
	
	/**
	 * ActivityMemberService 测试
	 */
	public static void main(String[] args) {
		ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");
		ActivityMemberService activityMemberService = context.getBean(ActivityMemberService.class);
		
		/* 测试queryActvityMember(ActivityMember activityMemeber) */
//		ActivityMember activityMemeber = new ActivityMember(1, 8);
//		System.out.println(activityMemberService.queryActvityMember(activityMemeber));
		
//		/* 测试addActvityMember(ActivityMember activityMemeber) */
//		ActivityMember activityMemeber = new ActivityMember(1, 8);
//		System.out.println(activityMemberService.addActvityMember(activityMemeber));
		
//		/* 测试deleteActvityMember(ActivityMember activityMemeber) */
//		ActivityMember activityMemeber = new ActivityMember(1, 8);
//		System.out.println(activityMemberService.deleteActvityMember(activityMemeber));
		
		/* 测试getAllActvityMember(ActivityMember activityMemeber) */
//		ActivityMember activityMemeber = new ActivityMember(null, 1);
//		List<ActivityMember> list = activityMemberService.getAllActvityMember(activityMemeber);
//		
//		for(ActivityMember actmem : list) {
//			System.out.println(actmem);
//		}
		
		/* 测试deleteActvityMember(ActivityMember activityMemeber) */
		ActivityMember activityMemeber = new ActivityMember(null, 1);
		System.out.println(activityMemberService.getActvityMemberCount(activityMemeber));
	
		
	}
}
