package com.xalz.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xalz.service.ActivityService;

/**
 * 活动控制类
 * @author po
 *
 */
@Controller
public class ActivityController {
	
	@Autowired
	ActivityService activityService;
	
	@RequestMapping("/index")
	public String getAllActiv(Map<String, Object> map) {
		System.out.println(activityService.getAllActiv());
		map.put("activities", activityService.getAllActiv());
	  return "index";
	}
	
	
	
}
