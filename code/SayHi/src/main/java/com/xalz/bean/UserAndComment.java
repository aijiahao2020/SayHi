package com.xalz.bean;

import java.util.Date;

public class UserAndComment {
	
	//用户编号
	private Integer userId;
	
	//评论编号
	private Integer cmtId;
	
	//活动编号
	private Integer activId;
	
	//用户姓名
	private String userName;
	
	//用户头像
	private String avatar;
	
	//评论时间
	private Date cmtTime;
	
	//评论内容
	private String cmtContent;

	
	public UserAndComment() {
		super();
	}


	public UserAndComment(Integer userId, Integer cmtId, Integer activId, String userName, String avatar, Date cmtTime,
			String cmtContent) {
		super();
		this.userId = userId;
		this.cmtId = cmtId;
		this.activId = activId;
		this.userName = userName;
		this.avatar = avatar;
		this.cmtTime = cmtTime;
		this.cmtContent = cmtContent;
	}


	public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public Integer getCmtId() {
		return cmtId;
	}


	public void setCmtId(Integer cmtId) {
		this.cmtId = cmtId;
	}


	public Integer getActivId() {
		return activId;
	}


	public void setActivId(Integer activId) {
		this.activId = activId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getAvatar() {
		return avatar;
	}


	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}


	public Date getCmtTime() {
		return cmtTime;
	}


	public void setCmtTime(Date cmtTime) {
		this.cmtTime = cmtTime;
	}


	public String getCmtContent() {
		return cmtContent;
	}


	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}


	@Override
	public String toString() {
		return "UserAndComment [userId=" + userId + ", cmtId=" + cmtId + ", activId=" + activId + ", userName="
				+ userName + ", avatar=" + avatar + ", cmtTime=" + cmtTime + ", cmtContent=" + cmtContent + "]";
	}

}
