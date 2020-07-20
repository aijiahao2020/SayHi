package com.xalz.service;

import java.util.List;

import com.xalz.bean.Message;

/**
 * 消息表操作接口
 * @author po
 * 问题:消息表是否需要时间属性？
 */
public interface MessageService {

	// 添加消息 √(给用户发送消息)
	public boolean createMessage(Message message);
	
	// 删除消息 √(可以用于清空用户消息)
	public boolean deleteMessage(Message message);
	
	// 获取该用户所有消息√
	public List<Message> getAllMessage(Message message);
	
	//通过用户编号获取所有消息√
	public List<Message> getMessageListByUserId(Integer userId);
	
	//通过消息编号删除消息√
	public boolean deleteMessageByPrimaryKey(Integer msgId);
	
}
