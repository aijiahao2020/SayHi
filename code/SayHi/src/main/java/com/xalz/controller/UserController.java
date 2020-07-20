package com.xalz.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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

//	@RequestMapping(value = "/addUser")
//	public String addUser(HttpServletRequest request ,User user,MultipartFile pictureFile) throws Exception{
//		
//		//使用UUID给图片重命名，并去掉四个“-”
//		String name = UUID.randomUUID().toString().replaceAll("-", "");
//		//获取文件的扩展名
//		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
//		//设置图片上传路径
//		String url = request.getSession().getServletContext().getRealPath("/upload");
//		System.out.println(url);
//		//以绝对路径保存重名命后的图片
//		pictureFile.transferTo(new File(url+"/"+name + "." + ext));
//		//把图片存储路径保存到数据库
//		user.setAvatar("upload/"+name + "." + ext);
//		
//		userService.register(user);
//		//重定向到查询所有用户的Controller，测试图片回显
//		return "redirect:/getAll";
//		
//	}
//	
//	//查询所有用户
	@RequestMapping(value = "/getAll")
	public String getAll(Model model) throws Exception {
		List<User> userList = userService.getAllUserList();
		model.addAttribute("userList", userList);
		System.out.println(userList);
		return "userList";
	}

//	@RequestMapping("/upload")
//	public String upload(@ModelAttribute("userDto") UserDto userDto) throws Exception{
//		User user = userDto.getUser();
//		MultipartFile multipartFile = userDto.getMultipartFile();
//		String imageName = UploadTool.uploadImage(multipartFile);
//		user.setAvatar(imageName);
//		userService.register(user);
//		return"redirect:/getAll";
//	}

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

}
