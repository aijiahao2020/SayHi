package com.xalz.bean;

import javax.persistence.*;

@Table(name = "favorite_info")
public class FavoriteInfo {
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "activ_id")
    private Integer activId;

    public FavoriteInfo() {
		super();
	}

	public FavoriteInfo(Integer userId, Integer activId) {
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
		return "FavoriteInfo [userId=" + userId + ", activId=" + activId + "]";
	}
}