package com.xalz.bean;

import java.util.Date;
import javax.persistence.*;

public class Message {
    @Id
    @Column(name = "msg_id")
    private Integer msgId;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "mess_info")
    private String messInfo;

    @Column(name = "mess_time")
    private Date messTime;

    
    public Message() {
		super();
	}

	public Message(Integer msgId, Integer userId, String messInfo, Date messTime) {
		super();
		this.msgId = msgId;
		this.userId = userId;
		this.messInfo = messInfo;
		this.messTime = messTime;
	}

	/**
     * @return msg_id
     */
    public Integer getMsgId() {
        return msgId;
    }

    /**
     * @param msgId
     */
    public void setMsgId(Integer msgId) {
        this.msgId = msgId;
    }

    /**
     * @return user_id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * @param userId
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * @return mess_info
     */
    public String getMessInfo() {
        return messInfo;
    }

    /**
     * @param messInfo
     */
    public void setMessInfo(String messInfo) {
        this.messInfo = messInfo;
    }

    /**
     * @return mess_time
     */
    public Date getMessTime() {
        return messTime;
    }

    /**
     * @param messTime
     */
    public void setMessTime(Date messTime) {
        this.messTime = messTime;
    }

	@Override
	public String toString() {
		return "Message [msgId=" + msgId + ", userId=" + userId + ", messInfo=" + messInfo + ", messTime=" + messTime
				+ "]";
	}
    
}