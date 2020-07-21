package com.xalz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xalz.bean.User;
import com.xalz.bean.UserLabel;
import com.xalz.mappers.UserLabelMapper;
import com.xalz.mappers.UserMapper;
import com.xalz.service.UserLabelService;

/**
 * 用户标签表操作实现类
 * @author aijiahao
 *
 */
@Service("userLabelService")
public class UserLabelServiceImpl implements UserLabelService {
	
	//用户标签 dao
	@Autowired
	UserLabelMapper userLabelMapper;
	
	@Autowired
	UserMapper userMapper;

	
	/**
	 * 通过用户编号更新用户标签
	 */
	//通过用户编号更新用户标签
	@Override
	public boolean updateUserLabelByUserId(Integer userId, List<String> labelList) {
		UserLabel userLabel = new UserLabel(null, userId, null);
		userLabelMapper.delete(userLabel);
//		if(labelList.isEmpty()) {
//			UserLabel adduserLabel = new UserLabel(null, userId, "科技");
//			userLabelMapper.insert(adduserLabel);
//			adduserLabel.setLabelName("人文");
//			userLabelMapper.insert(adduserLabel);
//		}else if(labelList.size() == 1) {
//			UserLabel adduserLabel = new UserLabel(null, userId, labelList.get(1));
//			userLabelMapper.insert(adduserLabel);
//			adduserLabel.setLabelName("人文");
//			userLabelMapper.insert(adduserLabel);
//		}else {
//			for(String label : labelList) {
//				UserLabel adduserLabel = new UserLabel(null, userId, label);
//				userLabelMapper.insert(adduserLabel);
//			}
//		}
		
		if(!labelList.isEmpty()) {
			for(String label : labelList) {
				UserLabel adduserLabel = new UserLabel(null, userId, label);
				userLabelMapper.insert(adduserLabel);
			}
		}
		
		return true;
	}
	
	/**
	 * 获取用户指定索引的标签
	 * index = 1 确定首页第一个标签名
	 * index = 2 确定首页第二个标签名
	 */
	@Override
	public String queryUserLabelByUserId(Integer userId, Integer index) {
		UserLabel userLabel = new UserLabel();
		userLabel.setUserId(userId);
		List<UserLabel> userLabelList = userLabelMapper.select(userLabel);
		if(index == 1) {
			if(userLabelList.isEmpty()) {
				return "科教";
			}else{
				return userLabelList.get(0).getLabelName();
			}
		}else{
			if(userLabelList.isEmpty()) {
				return "人文";
			}else if(userLabelList.size() == 1){
				userLabel.setLabelName("人文");
				if(userLabelMapper.selectOne(userLabel) != null) {
					return "科教";
				}else {
					return "人文";
				}
			}else {
				return userLabelList.get(1).getLabelName();
			}
		}
		
	}
	
	/**
	 * 添加用户标签
	 */
	@Override
	public boolean addUserLabel(UserLabel userLabel) {
		if (userLabelMapper.insert(userLabel) != 0) {
            return true;
        } else return false;
	}

	/**
	 * 删除用户标签
	 */
	@Override
	public boolean deleteUserLabel(UserLabel userLabel) {
		if (userLabelMapper.delete(userLabel) != 0) {
            return true;
        } else return false;
	}

	/**
	 * 查询点赞信息是否存在
	 */
	@Override
	public List<UserLabel> getUserLabel(UserLabel userLabel) {
		return userLabelMapper.select(userLabel);
	}

	/**
	 * 查询该用户标签是否存在
	 */
	@Override
	public boolean queryUserLabel(UserLabel userLabel) {
		if (userLabelMapper.selectOne(userLabel) != null) {
            return true;
        } else return false;
	}

	/**
	 * 通过用户编号查询用户标签
	 */
	@Override
	public List<UserLabel> getMyUserByUserId(Integer userId) {
		UserLabel userLabel = new UserLabel();
		userLabel.setUserId(userId);
		List<UserLabel> userLabelList = userLabelMapper.select(userLabel);
		
		return userLabelList;
	}

}
