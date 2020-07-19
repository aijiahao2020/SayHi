package com.xalz.service;

import java.util.List;

import com.xalz.bean.Comment;
import com.xalz.bean.UserAndComment;

import tk.mybatis.mapper.entity.Example;

/**
 * 评论表操作接口
 * @author po
 *
 */
public interface CommentService {
	
	//添加评论√
	public boolean addComment(Comment comment);
	
	//删除评论√  (查询条件使用等号)
	public boolean deleteComment(Comment comment);
	
	//根据主键删除评论√
	public boolean deleteCommentByPrimaryKey(Integer cmtId);
	
	//通过Example更新评论(更新null)√
	public boolean updateCommentByExample(Comment comment, Example example);
	
	//通过Example更新评论(不更新null)√
	public boolean updateCommentByExampleSelective(Comment comment, Example example);
	
	//更据主键更新评论√
	public boolean updateCommentByPrimaryKey(Comment comment);
	
	//使用QBC查询评论√
	public List<Comment> getCommentListByExample(Example example);
	
	//根据条件获取评论√ (查询条件使用等号,查询一个活动下的评论，或用户所有评论)
	public List<Comment> getCommentListByEqual(Comment comment);
	
	//更据活动编号查询评论数√ (查询条件使用等号，通过活动编号查询评论数)
	public Integer getCommentCount(Comment comment);
	
	//通过评论数进行排序
	
	//通过活动编号获取活动的评论及用户√
	public List<UserAndComment> getUserCommentByActivId(Comment comment);
	
}
