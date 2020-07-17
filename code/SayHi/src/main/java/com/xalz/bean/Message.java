package com.xalz.bean;

import javax.persistence.*;

public class Message {
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "mess_info")
    private String messInfo;

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
}