package com.xalz.service.impl;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.Comment;
import com.xalz.bean.UserAndComment;
import com.xalz.mappers.CommentMapper;
import com.xalz.service.ActivityService;
import com.xalz.service.CommentService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

/**
 * 评论表操作实现类
 * @author  po
 *
 */
@Service("commentService")
public class CommentServiceimpl implements CommentService{
	
	@Autowired
	CommentMapper commentMapper;
	
	@Autowired
	ActivityService activityService;
	
	/**
	 * 通过评论编号获取评论信息
	 */
	public Comment getCommentByCmtId(Integer cmtId){
		return commentMapper.selectByPrimaryKey(cmtId);
	}
	
	/**
	 * 获取所有的评论
	 */
	
	@Override
	public List<Comment> getAllComment() {
		return commentMapper.selectAll();
	}

	
	/**
	 * 添加评论
	 */
	@Override
	public boolean addComment(Comment comment) {
		comment.setCmtTime(new Date());
		if(commentMapper.insert(comment) == 1) {
			activityService.updateActivCmtSelfByPrimaryKey(comment.getActivId(), 1);
				return true;
		}else return false;
	}

	/**
	 *  删除评论
	 */
	@Override
	public boolean deleteComments(Comment comment) {
		Example example = new Example(Comment.class);
		Criteria criteria = example.createCriteria();
		
		Integer num = commentMapper.deleteByExample(example);
		return false;
	}
	
	/**
	 *   根据主键删除评论
	 */
	@Override
	public boolean deleteCommentByPrimaryKey(Integer cmtId) {
		Comment comment = commentMapper.selectByPrimaryKey(cmtId);
		if(commentMapper.deleteByPrimaryKey(cmtId) != 0) {
			activityService.updateActivCmtSelfByPrimaryKey(comment.getActivId(), 0);
			return true;
		}else return false;
	}

	/**
	 * 通过Example更新评论(更新null)
	 */
	@Override
	public boolean updateCommentByExample(Comment comment, Example example) {
		if(commentMapper.updateByExample(comment, example) != 0)
			return true;
			else return false;
	}
	
	/**
	 * 通过Example更新评论(不更新null)
	 */
	@Override
	public boolean updateCommentByExampleSelective(Comment comment, Example example) {
		if(commentMapper.updateByExampleSelective(comment, example) != 0)
			return true;
			else return false;
	}
	
	
	/**
	 * 更据主键更新评论
	 */
	@Override
	public boolean updateCommentByPrimaryKey(Comment comment) {
		if(commentMapper.updateByPrimaryKey(comment) == 1)
			return true;
			else return false;
	}
	
	

	/**
	 * 使用QBC查询评论
	 */
	@Override
	public List<Comment> getCommentListByExample(Example example) {
		return commentMapper.selectByExample(example);
	}

	/**
	 * 根据条件获取评论
	 */
	@Override
	public List<Comment> getCommentListByEqual(Comment comment) {
		return commentMapper.select(comment);
	}

	/**
	 * 更据活动编号查询评论数
	 */
	@Override
	public Integer getCommentCount(Comment comment) {
		return commentMapper.selectCount(comment);
	}

	/**
	 * 通过活动编号获取活动的评论及用户
	 */
	@Override
	public List<UserAndComment> getUserCommentByActivId(Integer activId) {
		Comment comm = new Comment();
		comm.setActivId(activId);
		return commentMapper.selectUserCommentByActivId(comm);
	}

}
