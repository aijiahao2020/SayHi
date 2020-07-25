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
//        User user = new User(null,"xq1","12345",null);
//        System.out.println(userService.queryUser(user));
//        userService.register(user);
        
        //getUserByPrimaryKey()
//        System.out.println(userService.getUserByPrimaryKey(1));
		
        //根据用户编号获取进行中用户发起活动
//        List<ActivityUser> activUser = userService.getAllAUMPgByUserId(1);
//        for(ActivityUser au : activUser){
//           System.out.println(au);
//         }
        
      //根据用户编号获取用户点赞过的历史活动
//          List<ActivityUser> activUser = userService.getLaunchAUMPgByUserId(1);
//          for(ActivityUser au : activUser){
//            System.out.println(au);
//          }
        
        //根据用户编号获取用户点赞过的历史活动
//        	List<ActivityUser> activUser = userService.getFavorAUMPdByUserId(1);
//        	for(ActivityUser au : activUser){
//        		System.out.println(au);
//        	}
      //根据用户编号获取参加过得的历史活动
//        	List<ActivityUser> activUser = userService.getAttendedAUMPdByUserId(1);
//	    	for(ActivityUser au : activUser){
//	    		System.out.println(au);
//	    	}
        User user = new User(4,"ajhhaoge","12345",null);
//        String[] labels = {"爬山","动漫"};
        String[] labels = null;
        System.out.println(userService.updateUserInformation(user, labels));
	}
	
}
