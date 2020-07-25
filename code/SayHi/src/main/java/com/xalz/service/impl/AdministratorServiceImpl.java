package com.xalz.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.Activity;
import com.xalz.bean.Administrator;
import com.xalz.bean.Comment;
import com.xalz.bean.Message;
import com.xalz.bean.User;
import com.xalz.mappers.ActivityMapper;
import com.xalz.mappers.AdministratorMapper;
import com.xalz.mappers.CommentMapper;
import com.xalz.mappers.UserMapper;
import com.xalz.service.ActivityMemberService;
import com.xalz.service.AdministratorService;
import com.xalz.service.MessageService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

/**
 * 管理员service实现类
 * Description:
 * @author aijiahao
 * @date 2020年7月24日
 *
 */
@Service("AdministratorService")
public class AdministratorServiceImpl implements AdministratorService{
	
	@Autowired
	AdministratorMapper administratorMapper;
	
	@Autowired
	ActivityMapper activityMapper;
	
	@Autowired
	ActivityMemberService activityMemberService;
	
	@Autowired
	MessageService messageService;
	
	@Autowired
	CommentMapper commentMapper;
	
	@Autowired
	UserMapper userMapper;
	

	/**
	 * 在管理员端添加或修改用户
	 */
	@Override
	public boolean updateUserInAdmin(User user) {
		if(user.getUserId() != null) {
			if(userMapper.updateByPrimaryKeySelective(user) != 0) {
				return true;
			}else {
				return false;
			}
			
		}else {
			if(userMapper.insert(user) != 0) {
				return true;
			}else {
				return false;
			}
		}
	}


	/**
	 * 在管理员端添加或修改评论
	 */

	@Override
	public boolean updateCmtInAdmin(Comment cmt) {
		if(cmt.getCmtId() != null) {
			if(commentMapper.updateByPrimaryKeySelective(cmt) != 0) {
				return true;
			}else {
				return false;
			}
			
		}else {
			cmt.setCmtTime(new Date());
			if(commentMapper.insert(cmt) != 0) {
				return true;
			}else {
				return false;
			}
		}
		
	}
	
	/**
	 * 在管理员端添加或修改活动
	 */
	@Override
	public boolean updateActivInAdmin(Activity activ) {
		if(activ.getActivId() != null) {
			activityMapper.updateByPrimaryKeySelective(activ);
			return true;
		}else {
			if(activityMapper.insert(activ) != 0) {
				return true;
			}else {
				return false;
			}
		}
		
	}

	
	/**
	 * 根据表单对用户表进行模糊查询
	 */
	@Override
  	public List<User> getUserSearchInAdmin(User user){
		Example example = new Example(User.class);
		//设置查询的及结果按照用户编号升序排列
//		example.setOrderByClause("userName DESC");
		Criteria criteria = example.createCriteria();
		if(user != null) {
			if(user.getUserId() != null) {
				criteria.andLike("userId", "%" + user.getUserId() + "%");
			}
			if(user.getUserName() != null) {//设置活动名查询条件
				criteria.andLike("userName", "%" + user.getUserName() + "%");
			}
			if(user.getAvatar() != null) {
				criteria.andLike("avatar", "%" + user.getAvatar() + "%");
			}
			return userMapper.selectByExample(example);
		}else {
			return userMapper.selectAll();
		}
  	}
	
	/**
	 * 根据表单对评论表进行模糊查询
	 */
	@Override
	public List<Comment> getCmtSearchInAdmin(Comment cmt) {
		Example example = new Example(Comment.class);
		//设置查询的及结果按照活动开始时间升序排列
		example.setOrderByClause("cmt_time DESC");
		Criteria criteria = example.createCriteria();
		if(cmt != null) {
			if(cmt.getActivId() != null) {
				criteria.andLike("activId", "%" + cmt.getActivId() + "%");
			}
			if(cmt.getUserId() != null) {//设置活动名查询条件
				criteria.andLike("userId", "%" + cmt.getUserId() + "%");
			}
			if(cmt.getCmtContent() != null) {
				criteria.andLike("cmtContent", "%" + cmt.getCmtContent() + "%");
			}
			return commentMapper.selectByExample(example);
		}else {
			return commentMapper.selectAll();
		}
	}
	
	/**
	 * 根据表单对活动表进行模糊查询
	 */
	@Override
	public List<Activity> getActivSearchInAdmin(Activity activ) {
		Example example = new Example(Activity.class);
		//设置查询的及结果按照活动开始时间升序排列
		example.setOrderByClause("activ_starttime DESC");
		Criteria criteria = example.createCriteria();
		if(activ != null) {
			if(activ.getUserId() != null) {
				criteria.andLike("userId", "%" + activ.getUserId() + "%");
			}
			if(activ.getActivName() != null && activ.getActivName().length() > 0) {//设置活动名查询条件
				criteria.andLike("activName", "%" + activ.getActivName() + "%");
			}
			if(activ.getActivId() != null) {
				criteria.andLike("activId", "%" + activ.getActivId() + "%");
			}
			return activityMapper.selectByExample(example);
		}else {
			return activityMapper.selectAll();
		}
		
		
		
	}
	/**
	 * 根据主键删除某一活动
	 */
	@Override
	public boolean deleteActivByPrimaryKey(Integer activId) {
		List<User> userList = activityMemberService.getUserListByActivity(activId);
		Activity activity = activityMapper.selectByPrimaryKey(activId);
		for(User user : userList) {
			String messInfo = null;
			Message message = new Message();
			message.setUserId(user.getUserId());
			message.setMessTime(new Date());
			if(user.getUserId() == activity.getUserId()) {
				messInfo = "您创建的活动 《";
			}else {
				messInfo = "您参加的活动 《";
			}
			
			messInfo = messInfo + activity.getActivName() + "》由于某些原因，已被管理员删除，请遵守SayHi规范！";
			message.setMessInfo(messInfo);
			messageService.createMessage(message);
		}
		if (activityMapper.deleteByPrimaryKey(activId) == 1) {
			return true;
		}else return false;
	}
	
	
	/**
	 * 根据管理员的用户名和密码查询管理信息
	 *
	 * @param Administrator
	 * @return
	 */
	@Override
	public Administrator getAdminByExample(Administrator admin) {
		return administratorMapper.selectOne(admin);
	}

	
	/**
	 * 用户登录
	 *
	 * @param Administrator
	 * @return
	 */
	public boolean queryAdministrator(Administrator admin) {
		if (administratorMapper.selectOne(admin) != null) {
			return true;
		} else
			return false;
	}

}
