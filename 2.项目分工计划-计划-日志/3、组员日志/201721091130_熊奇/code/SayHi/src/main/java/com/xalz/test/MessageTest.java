package com.xalz.test;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xalz.bean.Message;
import com.xalz.service.MessageService;

public class MessageTest {
	/**
	 * MessageService 测试
	 */
	public static void main(String[] args) {
		ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");
		MessageService messageService = context.getBean(MessageService.class);
		
		/* 测试createMessage(Message message) */
//		Message message = new Message(1,"活动结束啦");
//		System.out.println(messageService.createMessage(message));
		
		/* 测试deleteMessage(Message message) */
//		Message message = new Message(1,null);
//		System.out.println(messageService.deleteMessage(message));
		
		/* 测试getAllMessage(Message message) */
//		Message message = new Message(3,null,null);
//		List<Message> list = messageService.getAllMessage(message);
//		for(Message mess : list) {
//			System.out.println(mess);
//		}
		/* getMessageListByUserId */
//		List<Message> list = messageService.getMessageListByUserId(2);
//		for(Message mess : list) {
//			System.out.println(mess);
//		}
		
		System.out.println(messageService.deleteMessageByPrimaryKey(1));
	}
}
