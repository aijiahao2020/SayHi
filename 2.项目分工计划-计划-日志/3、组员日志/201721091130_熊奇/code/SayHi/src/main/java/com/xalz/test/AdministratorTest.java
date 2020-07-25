package com.xalz.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xalz.bean.Administrator;
import com.xalz.service.AdministratorService;

public class AdministratorTest {
	
	public static void main(String[] args) {
		ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");
		AdministratorService administratorService = context.getBean(AdministratorService.class);
		
		/* 根据管理员的用户名和密码查询管理信息 */
//		Administrator admin = new Administrator(null,"aijiahao", "123456", null);
//		System.out.println(administratorService.queryAdministrator(admin));
		
		/* 根据管理员的用户名和密码查询管理信息 */
		Administrator admin = new Administrator(null,"艾佳豪", "123456", null);
		System.out.println(administratorService.getAdminByExample(admin));
	}
}
