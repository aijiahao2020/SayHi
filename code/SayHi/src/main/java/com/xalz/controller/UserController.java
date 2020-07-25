package com.xalz.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xalz.bean.ActivityUser;
import com.xalz.bean.User;
import com.xalz.bean.UserLabel;
import com.xalz.service.ActivityService;
import com.xalz.service.UserLabelService;
import com.xalz.service.UserService;
import com.xalz.tool.ImageUtils;

/**
 * 登录
 * 
 * @author po
 *
 */
@Controller
public class UserController {

	// 用户操作类
	@Autowired
	UserService userService;

	// 活动操作类
	@Autowired
	ActivityService activityService;

	// 用户标签操作类
	@Autowired
	UserLabelService userLabelService;

	@RequestMapping("/login1")
	public String login1() {
		return "login";
	}

	@RequestMapping("/register1")
	public String register1() {
		return "register";
	}

	/**
	 * 获取我正在进行的全部活动
	 * 
	 * @return
	 */
	@RequestMapping("/myAttendingActiv")
	public String myAttendingActiv(HttpSession session, Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		List<ActivityUser> activityUsers = userService.getAllAUMPgByUserId(user.getUserId());
		map.put("activityUsers", activityUsers);
		map.put("isDel", "");
		map.put("choose", 1);
		return "personPage";
	}

	/**
	 * 获取我发起的活动
	 * 
	 * @return
	 */
	@RequestMapping("/myLaunchedActiv")
	public ModelAndView myLaunchedActiv(HttpSession session, ModelAndView model) {
		User user = (User) session.getAttribute("user");
		List<ActivityUser> activityUsers = userService.getLaunchAUMPgByUserId(user.getUserId());
		model.setViewName("personPage");
		model.addObject("activityUsers", activityUsers);
		model.addObject("isDel", "isDel");
		model.addObject("choose", 2);
		return model;
	}

	/**
	 * 获取我点赞过的活动
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/myFavoriteActiv")
	public String myFavoriteActiv(HttpSession session, Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		List<ActivityUser> activityUsers = userService.getFavorAUMPdByUserId(user.getUserId());
		map.put("activityUsers", activityUsers);
		map.put("isDel", "");
		map.put("choose", 1);
		return "actHistory";
	}

	/**
	 * 获取我评论过的活动
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/myCommentedActiv")
	public String myCommentedActiv(HttpSession session, Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		List<ActivityUser> activityUsers = userService.getCmtAUMPdByUserId(user.getUserId());
		map.put("activityUsers", activityUsers);
		map.put("isDel", "");
		map.put("choose", 2);
		return "actHistory";
	}

	/**
	 * 我参加过的活动
	 * 
	 * @return
	 */
	@RequestMapping("/myAttendedActiv")
	public String myAttendedActiv(HttpSession session, Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		List<ActivityUser> activityUsers = userService.getAttendedAUMPdByUserId(user.getUserId());
		map.put("activityUsers", activityUsers);
		map.put("isDel", "");
		map.put("choose", 3);
		return "actHistory";
	}

	/**
	 * 个人主页查询我的user信息
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/myUserInfo")
	public String getMyInfo(HttpServletRequest request, Map<String, Object> map) {
		User user = (User) request.getSession().getAttribute("user");
//		User user2 =  userService.getUserByPrimaryKey(user.getUserId());
		System.out.println(user+"mmmmmmmmmmmmm");
		List<UserLabel> userLabels = userLabelService.getMyUserByUserId(user.getUserId());
//		map.put("user", user);
		//获取标签列表数组
		List<Integer> labels = new ArrayList<Integer>(Arrays.asList(0,0,0,0,0,0,0,0,0));
		String[] ss = {"摄影","食品","电影","宠物","艺术","运动","游戏","写作","科技"};
		for(int i = 0; i < userLabels.size();i++) {
			for(int j = 0;j < ss.length;j++) {
				if(ss[j].equals(userLabels.get(i).getLabelName())) {
					labels.set(j, 1);
					break;
				}
			}
		}
		System.out.println(labels);
		map.put("userLabels", userLabels);
		map.put("labels", labels);
		return "myInfoPage";
	}

	/**
	 * 获取用户信息
	 * 
	 * @param userId
	 * @param map
	 * @return
	 */
	@RequestMapping("/getUserInfo/{id}")
	public String getUserInfoByUserId(@PathVariable("id") Integer userId, Map<String, Object> map) {
		// 获取用户信息
		User user = userService.getUserByPrimaryKey(userId);
		// 获取用户标签
		List<UserLabel> userLabels = userLabelService.getMyUserByUserId(userId);
		// 获取用户正在参与的行动
		List<ActivityUser> activityUsers = userService.getAllAUMPgByUserId(userId);
		// 存入map
		map.put("user1", user);
		map.put("userLabels", userLabels);
		map.put("activityUsers", activityUsers);
		return "userInfo";
	}

	/**
	 * 修改用户信息
	 * 
	 * @param user
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo(User user,@RequestParam(value = "userLabels", required = false) String[] userLabels, HttpServletRequest request) throws IOException {
		// 1. 获取 user 信息
		User user1 = (User) request.getSession().getAttribute("user");
		System.out.println(user1 + "uuuuuuuuuuuu");
		user.setUserId(user1.getUserId());
		user.setPassword(user1.getPassword());
		//2. 设置 图片
		String avatar = ImageUtils.upload(request, user.getFile());
		System.out.println("avatar" + avatar);
		if(avatar != null)
		user.setAvatar(avatar);
		else {
			user.setAvatar(user1.getAvatar());
		}
		request.getSession().setAttribute("user",user);
		System.out.println(userLabels);
		System.out.println(user);
		userService.updateUserInformation(user, userLabels);
		return "redirect:/myUserInfo";
	}

	/**
	 * 查询所有用户
	 * 
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
	public String upload(User user, HttpServletRequest request, Model model) throws Exception {
		// 保存数据库的路径
		String sqlPath = null;
		// 定义文件保存的本地路径
		String localPath = "D:\\File\\";
		// 定义 文件名
		String filename = null;
		if (!user.getFile().isEmpty()) {
			// 生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			// 获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType = user.getFile().getContentType();
			// 获得文件后缀名
			String suffixName = contentType.substring(contentType.indexOf("/") + 1);
			// 得到 文件名
			filename = uuid + "." + suffixName;
			// 文件保存路径
			user.getFile().transferTo(new File(localPath + filename));
		}
		// 把图片的相对路径保存至数据库
		sqlPath = "/images/" + filename;
		System.out.println(sqlPath);
		user.setAvatar(sqlPath);
		userService.register(user);
		model.addAttribute("user", user);
		return "redirect:/getAll";
	}

	/**
	 * 登录
	 * 
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(ModelAndView model, User user,HttpServletRequest request) {
		if (userService.queryUser(user)) {
			model.setViewName("redirect:/index");
//			model.addObject("user", userService.getUserByExample(user));
			request.getSession().setAttribute("user", userService.getUserByExample(user));
			System.out.println(userService.getUserByExample(user) + "ddddddddd");
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
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/index";
	}

}
