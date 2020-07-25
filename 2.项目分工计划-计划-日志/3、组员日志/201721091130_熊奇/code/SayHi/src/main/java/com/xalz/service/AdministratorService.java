package com.xalz.service;

import java.util.List;

import com.xalz.bean.Activity;
import com.xalz.bean.Administrator;
import com.xalz.bean.Comment;

public interface AdministratorService {
	
	//根据表单对评论表进行模糊查询
  	public List<Comment> getCmtSearchInAdmin(Comment cmt);
  	
  	//根据表单对活动表进行模糊查询
  	public List<Activity> getActivSearchInAdmin(Activity activ);
	
	//根据管理员的用户名和密码查询管理信息
	public Administrator getAdminByExample(Administrator admin);
	
	//查询登录管理员是否存在√
    public boolean queryAdministrator(Administrator admin);
  	
  	//根据主键删除某一活动√
  	public boolean deleteActivByPrimaryKey(Integer activId);
  	
}
