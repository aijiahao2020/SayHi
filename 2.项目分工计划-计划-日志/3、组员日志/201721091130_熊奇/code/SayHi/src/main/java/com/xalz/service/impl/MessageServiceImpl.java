package com.xalz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.Message;
import com.xalz.mappers.MessageMapper;
import com.xalz.service.MessageService;

/**
 * 消息类
 * @author aijiahao
 *
 */
@Service("messageService")
public class MessageServiceImpl implements MessageService {
	
	//消息 dao
	@Autowired
	MessageMapper messageMapper;

	
	/**
	 * 添加消息 (给用户发送消息)
     */
	@Override
	public boolean createMessage(Message message) {
		if (messageMapper.insert(message) == 1) {
			return true;
		}else return false;
	}

	/**
	 * 删除消息
     */
	@Override
	public boolean deleteMessage(Message message) {
		if (messageMapper.delete(message) != 0) {
			return true;
		}else return false;
	}

	/**
	 * 获取该用户所有消息
     */
	@Override
	public List<Message> getAllMessage(Message message) {
		return messageMapper.select(message);
	}

	/**
	 * 通过用户编号获取所有消息
     */
	@Override
	public List<Message> getMessageListByUserId(Integer userId) {
		Message message = new Message();
		message.setUserId(userId);
		return messageMapper.select(message);
	}

	/**
	 * 通过消息编号删除消息
     */
	@Override
	public boolean deleteMessageByPrimaryKey(Integer msgId) {
		if (messageMapper.deleteByPrimaryKey(msgId) == 1) {
			return true;
		}else return false;
	}

}
