package com.xalz.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
import com.xalz.tool.ImageUtils;

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
		map.put("userId", activity.getUserId());
		map.put("image", "modify_admin.png");
		return "activInform";
	}
	
	/**
	 * 跳转到添加活动页面
	 * @return
	 */
	@RequestMapping(value = "/toAddActivAdmin/{id}", method = RequestMethod.GET)
	public ModelAndView toAddActivityInAdmin(@PathVariable("id") Integer userId, ModelAndView model) {
		model.setViewName("activInform");
		model.addObject("userId", userId);
		model.addObject("image", "hold_admin.png");
		return model;
	}
	
	/**
	 *添加或更新活动
	 * @return
	 */
	@RequestMapping(value = "/updateActivAdmin")
	public String updateActivityAdmin(Activity activity, HttpServletRequest request, Map<String, Object> map) throws IOException {
		System.out.println(activity);
		map.put("userId", activity.getUserId());
		String activBill = ImageUtils.upload(request, activity.getFile());
		if(activBill != null)
			activity.setActivBill(activBill);
		//更新或添加活动，成功返回带活动编号的活动对象，失败返回null
		Activity activ = administratorService.updateActivInAdmin(activity);
		if(activ != null) {
			map.put("ret", "操作成功");
			map.put("activity", activ);
			map.put("image", "modify_admin.png");
		}else {
			map.put("ret", "操作失败");
			map.put("activity", activity);
			map.put("image", "hold_admin.png");
		}
		
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
	 * 通过活动编号删除活动
	 * 
	 * @return
	 * @throws IOException
	 */

//	@RequestMapping(value = "/delActivAdminByAjax", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public String deleteActivByAjax(@RequestParam("activId") Integer activId, HttpServletRequest request,
//			HttpServletResponse response) throws IOException {
//		String result = null;
//		
//		System.out.println("获取到Ajax请求");
//		if(activityService.deleteActivByPrimaryKey(activId)) {
//			result = "删除成功";
//		}else {
//			result = "删除失败";
//		}
//		return result;
//	}

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
		map.put("image", "modify_admin.png");
		return "cmtInform";
	}
	
	/**
	 * 跳转到添加评论页面
	 * @return
	 */
	@RequestMapping("/toAddCmtAdmin")
	public ModelAndView addCmtInAdmin(ModelAndView model) {
		model.setViewName("cmtInform");
		model.addObject("image", "hold_admin.png");
		return model;
	}
	
	/**
	 *添加或更新评论
	 * @return
	 */
	@RequestMapping(value = "/updateCmtAdmin")
	public String updateCommentAdmin(Comment cmt, HttpServletRequest request, Map<String, Object> map) throws IOException {
		System.out.println(cmt);
		//更新或添加活动，成功返回带评论编号的评论对象，失败返回null
		Comment comment = administratorService.updateCmtInAdmin(cmt);
		if(comment != null) {
			map.put("ret", "操作成功");
			map.put("cmt", comment);
			map.put("image", "modify_admin.png");
		}else {
			map.put("ret", "操作失败");
			map.put("cmt", cmt);
			map.put("image", "hold_admin.png");
		}
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
	 * 查询所有用户信息
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
	 * 通过用户编号和用户名进行模糊查询
	 */
	@RequestMapping(value = "/userSearchAdmin", method = RequestMethod.GET)
	public String getUserSearchInAdmin(@RequestParam(value = "pn", defaultValue = "1") Integer pn, User user, Model model,
			HttpSession session) {
		// 获取session中的管理员账号
		System.out.println(pn);
		Administrator admin = (Administrator) session.getAttribute("admin");
		System.out.println(admin);
		if (admin != null) {
			// 查询之前只需要调用，传入页码，以及每页的大小
			PageHelper.startPage(pn, 10);
			// startPage后面紧跟的这个查询就是一个分页查询
			List<User> users = administratorService.getUserSearchInAdmin(user);
			// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
			// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
			PageInfo page = new PageInfo(users, 3);
			model.addAttribute("pageInfo", page);
			model.addAttribute("user", user);
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
		map.put("image", "modify_admin.png");
		return "userInform";
	}
	
	/**
	 * 跳转到添加评论页面
	 * @return
	 */
	@RequestMapping("/toAddUserAdmin")
	public ModelAndView addUserInAdmin(ModelAndView model) {
		model.setViewName("userInform");
		model.addObject("image", "hold_admin.png");
		return model;
	}
	
	/**
	 *添加或更新用户信息
	 * @return
	 */
	@RequestMapping(value = "/updateUserAdmin")
	public String updateUserAdmin(User user, HttpServletRequest request, Map<String, Object> map) throws IOException {
		System.out.println(user);
		String avatar = ImageUtils.upload(request, user.getFile());
		System.out.println("avatar" + avatar);
		if(avatar != null)
		user.setAvatar(avatar);
		//更新或添加活动，成功返回带用户编号的用户对象，失败返回null
		User getuser = administratorService.updateUserInAdmin(user);
		if(getuser != null) {
			map.put("ret", "操作成功");
			map.put("user", getuser);
			map.put("image", "modify_admin.png");
		}else {
			map.put("ret", "操作失败");
			map.put("user", user);
			map.put("image", "hold_admin.png");
		}
		
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
