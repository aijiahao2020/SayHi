package com.xalz.bean;

import java.util.Date;
import java.util.List;

public class ActivityUser {

	//活动编号
	Integer activId;
	
	//活动名
	String activName;
	
	//活动开始时间
	Date activStart;
	
	//活动海报
	String activBill;
	
	//活动成员人数
	Integer activNum;
	
	//活动用户列表
	List<User> userList;

	public ActivityUser() {
		super();
	}

	public ActivityUser(Integer activId, String activName, Date activStart, String activBill, Integer activNum,
			List<User> userList) {
		super();
		this.activId = activId;
		this.activName = activName;
		this.activStart = activStart;
		this.activBill = activBill;
		this.activNum = activNum;
		this.userList = userList;
	}

	public Integer getActivId() {
		return activId;
	}

	public void setActivId(Integer activId) {
		this.activId = activId;
	}

	public String getActivName() {
		return activName;
	}

	public void setActivName(String activName) {
		this.activName = activName;
	}

	public Date getActivStart() {
		return activStart;
	}

	public void setActivStart(Date activStart) {
		this.activStart = activStart;
	}

	public String getActivBill() {
		return activBill;
	}

	public void setActivBill(String activBill) {
		this.activBill = activBill;
	}

	public Integer getActivNum() {
		return activNum;
	}

	public void setActivNum(Integer activNum) {
		this.activNum = activNum;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	@Override
	public String toString() {
		return "ActivityUser [activId=" + activId + ", activName=" + activName + ", activStart=" + activStart
				+ ", activBill=" + activBill + ", activNum=" + activNum + ", userList=" + userList + "]";
	}
	
}
