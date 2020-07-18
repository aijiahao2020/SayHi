package com.xalz.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xalz.bean.UserLabel;
import com.xalz.service.UserLabelService;

public class UserLabelTest {

	/**
	 * UserLabelService 测试
	 */
	public static void main(String[] args) {
		ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");
		UserLabelService userLabelService = context.getBean(UserLabelService.class);
		
		/* addUserLabel(UserLabel userLabel) */
//		UserLabel userLabel = new UserLabel(null,1,"科技");
//		System.out.println(userLabelService.addUserLabel(userLabel));
		
		/* deleteUserLabel(UserLabel userLabel) */
//		UserLabel userLabel = new UserLabel(null,1,null);
//		System.out.println(userLabelService.deleteUserLabel(userLabel));
		
		/* getUserLabel(UserLabel userLabel) */
//		UserLabel userLabel = new UserLabel(null,1,null);
//		System.out.println(userLabelService.getUserLabel(userLabel));
		
		/* queryUserLabel(UserLabel userLabel) */
		UserLabel userLabel = new UserLabel(null,1,"科技");
		System.out.println(userLabelService.queryUserLabel(userLabel));
		
	}
}
