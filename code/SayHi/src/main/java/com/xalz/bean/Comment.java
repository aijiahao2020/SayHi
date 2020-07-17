package com.xalz.bean;

import java.util.Date;
import javax.persistence.*;

public class Comment {
    @Id
    @Column(name = "cmt_id")
    private Integer cmtId;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "activ_id")
    private Integer activId;

    @Column(name = "cmt_time")
    private Date cmtTime;

    @Column(name = "cmt_content")
    private String cmtContent;

    /**
     * @return cmt_id
     */
    public Integer getCmtId() {
        return cmtId;
    }

    /**
     * @param cmtId
     */
    public void setCmtId(Integer cmtId) {
        this.cmtId = cmtId;
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

    /**
     * @return cmt_time
     */
    public Date getCmtTime() {
        return cmtTime;
    }

    /**
     * @param cmtTime
     */
    public void setCmtTime(Date cmtTime) {
        this.cmtTime = cmtTime;
    }

    /**
     * @return cmt_content
     */
    public String getCmtContent() {
        return cmtContent;
    }

    /**
     * @param cmtContent
     */
    public void setCmtContent(String cmtContent) {
        this.cmtContent = cmtContent;
    }
}