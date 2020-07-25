package com.xalz.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Activity {
	@Id
	@Column(name = "activ_id")
	private Integer activId;

	@Column(name = "user_id")
	private Integer userId;

	@Column(name = "activ_name")
	private String activName;

	@Column(name = "activ_state")
	private String activState;

	@Column(name = "activ_city")
	private String activCity;

	@Column(name = "activ_address")
	private String activAddress;
	
	//*****更改*****
//	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd HH:mm",timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@Column(name = "activ_starttime")
	private Date activStarttime;
	
//	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd HH:mm",timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@Column(name = "activ_endtime")
	private Date activEndtime;

	@Column(name = "activ_brief")
	private String activBrief;

	@Column(name = "activ_label")
	private String activLabel;

	@Column(name = "exp_num")
	private Integer expNum;

	@Column(name = "limit_explain")
	private String limitExplain;

	@Column(name = "activ_bill")
	private String activBill;

	@Column(name = "favor_num")
	private Integer favorNum;

	@Column(name = "cmt_num")
	private Integer cmtNum;

	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public Activity() {
		super();
	}

	public Activity(Integer activId, Integer userId, String activName, String activState, String activCity,
			String activAddress, Date activStarttime, Date activEndtime, String activBrief, String activLabel,
			Integer expNum, String limitExplain, String activBill, Integer favorNum, Integer cmtNum) {
		super();
		this.activId = activId;
		this.userId = userId;
		this.activName = activName;
		this.activState = activState;
		this.activCity = activCity;
		this.activAddress = activAddress;
		this.activStarttime = activStarttime;
		this.activEndtime = activEndtime;
		this.activBrief = activBrief;
		this.activLabel = activLabel;
		this.expNum = expNum;
		this.limitExplain = limitExplain;
		this.activBill = activBill;
		this.favorNum = favorNum;
		this.cmtNum = cmtNum;
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
	 * @return activ_name
	 */
	public String getActivName() {
		return activName;
	}

	/**
	 * @param activName
	 */
	public void setActivName(String activName) {
		this.activName = activName;
	}

	/**
	 * @return activ_state
	 */
	public String getActivState() {
		return activState;
	}

	/**
	 * @param activState
	 */
	public void setActivState(String activState) {
		this.activState = activState;
	}

	/**
	 * @return activ_city
	 */
	public String getActivCity() {
		return activCity;
	}

	/**
	 * @param activCity
	 */
	public void setActivCity(String activCity) {
		this.activCity = activCity;
	}

	/**
	 * @return activ_address
	 */
	public String getActivAddress() {
		return activAddress;
	}

	/**
	 * @param activAddress
	 */
	public void setActivAddress(String activAddress) {
		this.activAddress = activAddress;
	}

	/**
	 * @return activ_starttime
	 */
	public Date getActivStarttime() {
		return activStarttime;
	}

	/**
	 * @param activStarttime
	 */
	public void setActivStarttime(Date activStarttime) {
		this.activStarttime = activStarttime;
	}

	/**
	 * @return activ_endtime
	 */
	public Date getActivEndtime() {
		return activEndtime;
	}

	/**
	 * @param activEndtime
	 */
	public void setActivEndtime(Date activEndtime) {
		this.activEndtime = activEndtime;
	}

	/**
	 * @return activ_brief
	 */
	public String getActivBrief() {
		return activBrief;
	}

	/**
	 * @param activBrief
	 */
	public void setActivBrief(String activBrief) {
		this.activBrief = activBrief;
	}

	/**
	 * @return activ_label
	 */
	public String getActivLabel() {
		return activLabel;
	}

	/**
	 * @param activLabel
	 */
	public void setActivLabel(String activLabel) {
		this.activLabel = activLabel;
	}

	/**
	 * @return exp_num
	 */
	public Integer getExpNum() {
		return expNum;
	}

	/**
	 * @param expNum
	 */
	public void setExpNum(Integer expNum) {
		this.expNum = expNum;
	}

	/**
	 * @return limit_explain
	 */
	public String getLimitExplain() {
		return limitExplain;
	}

	/**
	 * @param limitExplain
	 */
	public void setLimitExplain(String limitExplain) {
		this.limitExplain = limitExplain;
	}

	/**
	 * @return activ_bill
	 */
	public String getActivBill() {
		return activBill;
	}

	/**
	 * @param activBill
	 */
	public void setActivBill(String activBill) {
		this.activBill = activBill;
	}

	/**
	 * @return favor_num
	 */
	public Integer getFavorNum() {
		return favorNum;
	}

	/**
	 * @param favorNum
	 */
	public void setFavorNum(Integer favorNum) {
		this.favorNum = favorNum;
	}

	/**
	 * @return cmt_num
	 */
	public Integer getCmtNum() {
		return cmtNum;
	}

	/**
	 * @param cmtNum
	 */
	public void setCmtNum(Integer cmtNum) {
		this.cmtNum = cmtNum;
	}

	@Override
	public String toString() {
		return "Activity [activId=" + activId + ", userId=" + userId + ", activName=" + activName + ", activState="
				+ activState + ", activCity=" + activCity + ", activAddress=" + activAddress + ", activStarttime="
				+ activStarttime + ", activEndtime=" + activEndtime + ", activBrief=" + activBrief + ", activLabel="
				+ activLabel + ", expNum=" + expNum + ", limitExplain=" + limitExplain + ", activBill=" + activBill
				+ ", favorNum=" + favorNum + ", cmtNum=" + cmtNum + "]";
	}

}