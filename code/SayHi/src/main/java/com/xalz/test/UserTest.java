package com.xalz.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xalz.bean.User;
import com.xalz.service.UserService;

public class UserTest {
	
	public static void main(String[] args) {
		ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");

        UserService userService = context.getBean(UserService.class);

        // queryUser（）
        User user = new User(null,"xq1","1234561",null);
//        System.out.println(userService.queryUser(user));
        userService.register(user);
		
	}
	
}
