package com.xalz.test;

import java.util.LinkedList;
import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

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
//		UserLabel userLabel = new UserLabel(null,1,"科技");
//		System.out.println(userLabelService.queryUserLabel(userLabel));
		
//		List<String> label = new LinkedList<String>();
//		label.add("科技");
//		label.add("人文");
//		userLabelService.updateUserLabelByUserId(1, label);
		System.out.println(userLabelService.queryUserLabelByUserId(2, 1));
		System.out.println(userLabelService.queryUserLabelByUserId(2, 2));
	}
}
