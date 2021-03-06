package com.xalz.bean;

import javax.persistence.*;

@Table(name = "activity_member")
public class ActivityMember {
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "activ_id")
    private Integer activId;

    public ActivityMember() {
		super();
	}

	public ActivityMember(Integer userId, Integer activId) {
		super();
		this.userId = userId;
		this.activId = activId;
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
     * @return activ_id
     */
    public Integer getActivId() {
        return activId;
    }

    /**
     * @param activId
     */
    public void setActivId(Integer activId) {
        this.activId = activId;
    }

	@Override
	public String toString() {
		return "ActivityMember [userId=" + userId + ", activId=" + activId + "]";
	}
}