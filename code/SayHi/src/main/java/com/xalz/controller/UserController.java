package com.xalz.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.xalz.bean.User;
import com.xalz.service.UserService;
import com.xalz.tool.ImageUtils;

/**
 * 登录
 * 
 * @author po
 *
 */
@SessionAttributes("user")
@Controller
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/login1")
	public String login1() {
		return "login";
	}

	@RequestMapping("/register1")
	public String register1() {
		return "register";
	}
	
	/**
	 * 个人主页查询用户信息
	 * @param session
	 * @return
	 */
	@RequestMapping("/getUserInfo")
	public String getUserInfoByUserId(HttpSession session) {
		User user =  (User) session.getAttribute("user");
		userService.getUserByPrimaryKey(user.getUserId());
		return null;
	}
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo(User user,HttpServletRequest request) throws IOException {
		//1. 设置图像路径
		ImageUtils.upload(request, user.getFile());
		
		
		return null;
	}
	
	
	/**
	 * 查询所有用户
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getAll")
	public String getAll(Model model) throws Exception {
		List<User> userList = userService.getAllUserList();
		model.addAttribute("userList", userList);
		System.out.println(userList);
		return "userList";
	}


	@RequestMapping("/upload")
	public String upload(User user,HttpServletRequest request,Model model) throws Exception{
	  //保存数据库的路径
	  String sqlPath = null; 
	  //定义文件保存的本地路径
      String localPath="D:\\File\\";
      //定义 文件名
      String filename=null;  
      if(!user.getFile().isEmpty()){  
          //生成uuid作为文件名称  
          String uuid = UUID.randomUUID().toString().replaceAll("-","");  
          //获得文件类型（可以判断如果不是图片，禁止上传）  
          String contentType=user.getFile().getContentType();  
          //获得文件后缀名 
          String suffixName=contentType.substring(contentType.indexOf("/")+1);
          //得到 文件名
          filename=uuid+"."+suffixName; 
          //文件保存路径
          user.getFile().transferTo(new File(localPath+filename));  
      }
      //把图片的相对路径保存至数据库
      sqlPath = "/images/"+filename;
      System.out.println(sqlPath);
      user.setAvatar(sqlPath);
      userService.register(user);
      model.addAttribute("user", user);
	  return "redirect:/getAll";
	}
	
	/**
	 * 登录
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(ModelAndView model, User user) {
		if (userService.queryUser(user)) {
			model.setViewName("index");
			model.addObject("user", user);
			System.out.println(user);
			// 要加用户自定义活动
			return model;
		} else {
			model.setViewName("login");
			model.addObject("message", "用户名或密码错误");
			return model;
		}
	}

	/**
	 * 注册操作
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public Map<String, Object> register(User user, Map<String, Object> map) {
		if (userService.register(user)) {
			map.put("msg", "注册成功");
		} else {
			map.put("msg", "注册失败");
		}
		return map;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}

}
