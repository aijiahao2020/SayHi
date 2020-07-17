package com.xalz.bean;

import java.util.Date;
import javax.persistence.*;

public class Activity {
    @Id
    @Column(name = "activ_id")
    private Integer activId;

    @Column(name = "activ_name")
    private String activName;

    @Column(name = "activ_state")
    private String activState;

    @Column(name = "activ_city")
    private String activCity;

    @Column(name = "activ_address")
    private String activAddress;

    @Column(name = "activ_starttime")
    private Date activStarttime;

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

    @Column(name = "user_id")
    private Integer userId;

    public Activity() {
		super();
	}

	public Activity(Integer activId, String activName, String activState, String activCity, String activAddress,
			Date activStarttime, Date activEndtime, String activBrief, String activLabel, Integer expNum,
			String limitExplain, String activBill, Integer favorNum, Integer userId) {
		super();
		this.activId = activId;
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

	@Override
	public String toString() {
		return "Activity [activId=" + activId + ", activName=" + activName + ", activState=" + activState
				+ ", activCity=" + activCity + ", activAddress=" + activAddress + ", activStarttime=" + activStarttime
				+ ", activEndtime=" + activEndtime + ", activBrief=" + activBrief + ", activLabel=" + activLabel
				+ ", expNum=" + expNum + ", limitExplain=" + limitExplain + ", activBill=" + activBill + ", favorNum="
				+ favorNum + ", userId=" + userId + "]";
	}
    
    
}