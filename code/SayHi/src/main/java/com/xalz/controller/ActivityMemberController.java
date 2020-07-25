package com.xalz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xalz.bean.ActivityMember;
import com.xalz.service.ActivityMemberService;
import com.xalz.service.ActivityService;

@Controller
public class ActivityMemberController {

	@Autowired
	ActivityMemberService activityMemberService;
	
	@Autowired
	ActivityService activityService;
	
	/**
	 * 用户参加活动
	 * @param activityMember
	 * @return
	 */
	@RequestMapping(value = "/attendActiv",method = RequestMethod.POST)
	public String attendActiv(ActivityMember activityMember) {
		activityMemberService.addActvityMember(activityMember.getUserId(), activityMember.getActivId());
		return "redirect:/index/" + activityMember.getActivId();
	}
	
	/**
	 * 用户取消参加活动
	 * @param activityMember
	 * @return
	 */
	@RequestMapping(value = "/leaveActiv",method = RequestMethod.POST)
	public String leaveActiv(ActivityMember activityMember) {
		if(!activityService.queryActivSponsor(activityMember.getActivId(), activityMember.getUserId())) {
			activityMemberService.deleteActvityMember(activityMember);
		}
		System.out.println(activityMemberService.deleteActvityMember(activityMember));
		return "redirect:/index/" + activityMember.getActivId();
	}

}
