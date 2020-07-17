package com.xalz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
