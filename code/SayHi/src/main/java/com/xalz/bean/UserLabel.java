package com.xalz.bean;

import javax.persistence.*;

@Table(name = "user_label")
public class UserLabel {
    @Id
    @Column(name = "label_id")
    private Integer labelId;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "label_name")
    private String labelName;

    public UserLabel() {
		super();
	}

	public UserLabel(Integer labelId, Integer userId, String labelName) {
		super();
		this.labelId = labelId;
		this.userId = userId;
		this.labelName = labelName;
	}

	/**
     * @return label_id
     */
    public Integer getLabelId() {
        return labelId;
    }

    /**
     * @param labelId
     */
    public void setLabelId(Integer labelId) {
        this.labelId = labelId;
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
     * @return label_name
     */
    public String getLabelName() {
        return labelName;
    }

    /**
     * @param labelName
     */
    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }

	@Override
	public String toString() {
		return "UserLabel [labelId=" + labelId + ", userId=" + userId + ", labelName=" + labelName + "]";
	}
}