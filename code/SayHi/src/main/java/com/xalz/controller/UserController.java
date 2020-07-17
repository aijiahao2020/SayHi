package com.xalz.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xalz.bean.User;
import com.xalz.service.UserService;

/**
 * 登录
 * @author po
 *
 */
@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	
	
//	@ResponseBody
//    @RequestMapping(value = "/login",method=RequestMethod.POST)
//    public ModelAndView login(@RequestBody User user){
////		ModelAndView model = new ModelAndView();
////		model.setView(view);
////    	if(userService.queryUser(user))
////        return "index";
////    	else {
////    		
////    		return map;
////    	}
//    }
    
    /**
            * 注册操作
     */
    @ResponseBody
	@RequestMapping(value = "/register",method=RequestMethod.POST)
	public Map<String, Object> register(@RequestBody User user,Map<String, Object> map) {
		System.out.println(user);
		if(userService.register(user)) {
			map.put("msg", "注册成功");
		}
		else {
			map.put("msg", "注册失败");
		}
		return map;
	}
	
}
