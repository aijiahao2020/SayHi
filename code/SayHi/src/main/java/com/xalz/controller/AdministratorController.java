package com.xalz.controller;

import java.util.List;
import java.util.Map;

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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xalz.bean.Activity;
import com.xalz.bean.Administrator;
import com.xalz.bean.Comment;
import com.xalz.bean.User;
import com.xalz.service.ActivityService;
import com.xalz.service.AdministratorService;
import com.xalz.service.CommentService;
import com.xalz.service.UserService;

@Controller
public class AdministratorController {

	@Autowired
	AdministratorService administratorService;

	@Autowired
	ActivityService activityService;
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	UserService userService;

	/**
	 * 查询员工数据（分页查询）
	 * 
	 * @return
	 */
//	@RequestMapping("/emps")
//	public String getEmps(
//			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
//			Model model) {
//		// 这不是一个分页查询；
//		// 引入PageHelper分页插件
//		// 在查询之前只需要调用，传入页码，以及每页的大小
//		PageHelper.startPage(pn, 1);
//		// startPage后面紧跟的这个查询就是一个分页查询
//		List<User> emps = userService.getAllUserList();
//		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
//		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
//		PageInfo page = new PageInfo(emps, 3);
//		model.addAttribute("pageInfo", page);
//
//		return "list";
//	}

	/**
	 * 管理员登录
	 * 
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/loginAdmin", method = RequestMethod.POST)
	public ModelAndView login(ModelAndView model, Administrator admin, HttpServletRequest request) {
		// 对登入的管理员进行唯一存在查询
		if (administratorService.queryAdministrator(admin)) {
			model.setViewName("redirect:/activAdmin");
//			model.addObject("user", userService.getUserByExample(user));
			request.getSession().setAttribute("admin", administratorService.getAdminByExample(admin));
			System.out.println(administratorService.getAdminByExample(admin) + "ddddddddd");
			// 要加用户自定义活动
			return model;
		} else {
			model.setViewName("loginAdmin");
			model.addObject("message", "用户名或密码错误");
			model.addObject("admin", admin);
			return model;
		}
	}

	/**
	 * 登出操作
	 * @param request
	 * @return
	 */
	
	@RequestMapping("/logoutAdmin")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "loginAdmin";
	}
	
	/**
	 * 查询所有活动管理
	 */
	@RequestMapping("/activAdmin")
	public String getAllActivInAdmin(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,
			HttpSession session) {
		// 获取session中的管理员账号
		System.out.println(pn);
		Administrator admin = (Administrator) session.getAttribute("admin");
		System.out.println(admin);
		if (admin != null) {
			// 查询之前只需要调用，传入页码，以及每页的大小
			PageHelper.startPage(pn, 10);
			// startPage后面紧跟的这个查询就是一个分页查询
			List<Activity> activs = activityService.getAllActiv();
			// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
			// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
			PageInfo page = new PageInfo(activs, 3);
			model.addAttribute("pageInfo", page);
			return "activAdmin";
		} else {
			model.addAttribute("message", "登入已过期，请重新登入");
			return "loginAdmin";
		}

	}
	
	/**
	 * 通过模糊查询获取活动
	 */
	@RequestMapping("/activSeachAdmin")
	public String getActivSeachInAdmin(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Activity activity, Model model,
			HttpSession session) {
		// 获取session中的管理员账号
		System.out.println(activity);
		System.out.println(pn);
		Administrator admin = (Administrator) session.getAttribute("admin");
		System.out.println(admin);
		if (admin != null) {
			// 查询之前只需要调用，传入页码，以及每页的大小
			PageHelper.startPage(pn, 10);
			// startPage后面紧跟的这个查询就是一个分页查询
			List<Activity> activs = administratorService.getActivSearchInAdmin(activity);
			// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
			// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
			PageInfo page = new PageInfo(activs, 3);
			model.addAttribute("pageInfo", page);
			model.addAttribute("activity", activity);
			return "activAdmin";
		} else {
			model.addAttribute("message", "登入已过期，请重新登入");
			return "loginAdmin";
		}

	}

	/**
	 * 通过活动编号查询活动的详细信息
	 */
	@RequestMapping(value = "/activAdmin/{id}", method = RequestMethod.GET)
	public String getActivByActivId(@PathVariable("id") Integer activId, Map<String, Object> map) {
		Activity activity = activityService.getActivByPrimaryKey(activId);
		map.put("activity", activity);
		return "activInform";
	}

	/**
	 * 通过活动编号删除活动
	 */
	@RequestMapping(value = "/delActivAdmin/{id}", method = RequestMethod.GET)
	public String deleteActivByActivId(@PathVariable("id") Integer activId) {
		System.out.println(activityService.deleteActivByPrimaryKey(activId));
		return "redirect:/activAdmin";
	}

	/**
	 * 查询所有评论信息
	 */
	@RequestMapping(value = "/commentAdmin", method = RequestMethod.GET)
	public String getAllCmtInAdmin(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,
			HttpSession session) {
		// 获取session中的管理员账号
		System.out.println(pn);
		Administrator admin = (Administrator) session.getAttribute("admin");
		System.out.println(admin);
		if (admin != null) {
			// 查询之前只需要调用，传入页码，以及每页的大小
			PageHelper.startPage(pn, 10);
			// startPage后面紧跟的这个查询就是一个分页查询
			List<Comment> comments = commentService.getAllComment();
			// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
			// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
			PageInfo page = new PageInfo(comments, 3);
			model.addAttribute("pageInfo", page);
			return "cmtAdmin";
		} else {
			model.addAttribute("message", "登入已过期，请重新登入");
			return "loginAdmin";
		}
	}
	
	/**
	 * 查询所有评论信息
	 */
	@RequestMapping(value = "/commentSearchAdmin")
	public String getCmtSearchInAdmin(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Comment cmt, Model model,
			HttpSession session) {
		// 获取session中的管理员账号
		System.out.println(cmt);
		System.out.println(pn);
		Administrator admin = (Administrator) session.getAttribute("admin");
		System.out.println(admin);
		if (admin != null) {
			// 查询之前只需要调用，传入页码，以及每页的大小
			PageHelper.startPage(pn, 10);
			// startPage后面紧跟的这个查询就是一个分页查询
			List<Comment> comments = administratorService.getCmtSearchInAdmin(cmt);
			// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
			// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
			PageInfo page = new PageInfo(comments, 3);
			model.addAttribute("pageInfo", page);
			model.addAttribute("comment", cmt);
			return "cmtAdmin";
		} else {
			model.addAttribute("message", "登入已过期，请重新登入");
			return "loginAdmin";
		}
	}
	
	/**
	 * 通过评论编号查询评论的详细信息
	 */
	@RequestMapping(value = "/commentAdmin/{id}", method = RequestMethod.GET)
	public String getCommentByCmtId(@PathVariable("id") Integer cmtId, Map<String, Object> map) {
		Comment comment = commentService.getCommentByCmtId(cmtId);
		map.put("comment", comment);
		return "cmtInform";
	}

	/**
	 * 通过评论编号删除评论
	 */
	@RequestMapping(value = "/delCommentAdmin/{id}", method = RequestMethod.GET)
	public String deleteCommentByCmtId(@PathVariable("id") Integer cmtId) {
		commentService.deleteCommentByPrimaryKey(cmtId);
		return "redirect:/commentAdmin";
	}
	
	
	/**
	 * 查询所有评论信息
	 */
	@RequestMapping(value = "/userAdmin", method = RequestMethod.GET)
	public String getAllUserInAdmin(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,
			HttpSession session) {
		// 获取session中的管理员账号
		System.out.println(pn);
		Administrator admin = (Administrator) session.getAttribute("admin");
		System.out.println(admin);
		if (admin != null) {
			// 查询之前只需要调用，传入页码，以及每页的大小
			PageHelper.startPage(pn, 10);
			// startPage后面紧跟的这个查询就是一个分页查询
			List<User> users = userService.getAllUserList();
			// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
			// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
			PageInfo page = new PageInfo(users, 3);
			model.addAttribute("pageInfo", page);
			return "userAdmin";
		} else {
			model.addAttribute("message", "登入已过期，请重新登入");
			return "loginAdmin";
		}
	}
	
	/**
	 * 通过用户编号查询用户的详细信息
	 */
	@RequestMapping(value = "/userAdmin/{id}", method = RequestMethod.GET)
	public String getUserByUserId(@PathVariable("id") Integer userId, Map<String, Object> map) {
		User user = userService.getUserByPrimaryKey(userId);
		map.put("user", user);
		return "userInform";
	}

	/**
	 * 通过用户编号删除用户的所有信息
	 */
	@RequestMapping(value = "/delUserAdmin/{id}", method = RequestMethod.GET)
	public String deleteUserByUserId(@PathVariable("id") Integer userId) {
		userService.deleteUserByUserId(userId);
		return "redirect:/userAdmin";
	}

}
