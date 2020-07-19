package com.xalz.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xalz.bean.Activity;
import com.xalz.service.ActivityService;

import tk.mybatis.mapper.entity.Example;

/**
 * 活动控制类
 * @author po
 *
 */
@Controller
public class ActivityController {
	
	@Autowired
	ActivityService activityService;
	
	
	@RequestMapping(value = "/index/addActiv", method = RequestMethod.POST)
	public String addActivity(@ModelAttribute Activity activity) {
		activityService.createActiv(activity);
		return "index";
	}
	
	
	/**
	 * 首页查询活动
	 * @param map
	 * @return
	 */
	@RequestMapping("/index/search")
	public String getActivByName(Map<String, Object> map){
		Example example = new Example(Activity.class);
		map.put("activities", activityService.getActivListByExample(example));
		return "index";
	}
	
//	@RequestMapping("/index/")
//	public String getActivByP() {
	
//	}
	
	/**
	 * 获取所有活动：未登录
	 * @param map
	 * @return
	 */
	@RequestMapping("/index")
	public String getAllActiv(Map<String, Object> map) {
		System.out.println(activityService.getAllActiv());
		map.put("activities", activityService.getAllActiv());
	  return "index";
	}
	
	@RequestMapping("/index/")
	public String getAllActivByUser(Map<String, Object> map) {
		System.out.println(activityService.getAllActiv());
		map.put("activities", activityService.getAllActiv());
	  return "index";
	}
	
	
	
	
}
