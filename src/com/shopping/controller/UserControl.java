package com.shopping.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.shopping.pojo.Addr;
import com.shopping.pojo.User;
import com.shopping.service.IAddressService;
import com.shopping.service.IUserService;
import com.shopping.util.CommonUtils;
import com.shopping.util.FileTransferUtil;

@Controller
@RequestMapping(value="/user/")
public class UserControl {

	@Autowired
	private IUserService userService;
	
	/**
	 * 用户登录
	 * @param user
	 * @param req
	 * @return
	 */
	@RequestMapping("login")
	public String userLogin(User user,HttpServletRequest request,String url){
		user.setLoginpwd(CommonUtils.toMD5(user.getLoginpwd()));
		User resUser = userService.login(user.getUsername(), user.getLoginpwd());
		if(resUser == null){
			request.setAttribute("msg", "用户名或密码错误！！！");
			return "frontend/login";
		}
		request.getSession().setAttribute("user", resUser);
		if(url.equals("")){
			return "redirect:/prod/init";
		}
		return "redirect:"+url;
	}
	
	/**
	 * 用户注册
	 * @param userName
	 * @param password
	 * @param repass
	 * @param req
	 * @return
	 */
	@RequestMapping("register")
	public String userRegister(User user,HttpServletRequest req){
		//判断用户名是否存在
		User existedUser = userService.selectByUsername(user.getUsername());
		if(existedUser==null){
			user.setLoginpwd(CommonUtils.toMD5(user.getLoginpwd()));
			userService.insertUser(user);
			req.setAttribute("reg_msg", "注册成功！请到登录页面登录");
			return "frontend/register";
		}else{
			req.setAttribute("reg_msg", "注册失败！用户名已存在");
			return "frontend/register";
		}
		
	}
	
	/**
	 * 用户退出
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest req){
		req.getSession(true).invalidate();
		return "frontend/login";
	}
	
	/**
	 * 更新用户的信息
	 * @return
	 */
	@RequestMapping("updateUser")
	public String updateUserInfo(User user,HttpServletRequest req){
		userService.updateUser(user);
//		System.out.println("更新成功");
		//数据回显
		User resUser = userService.selectUserByUid(user.getUid());
		req.getSession().setAttribute("user", resUser);
		return "frontend/information";
	}
	
	/*
	 * 更改密码
	 */
	@RequestMapping("/updateUserPassword")
	public String updateUserPassword(int uid,String oldpassword,String newpassword ,String renewpassword,HttpServletRequest req){
		/*
		 * 根据原始查询，是否存在这个密码
		 */
		boolean flag = userService.selectPasswordByUidAndPassword(uid,oldpassword);
		if(!flag){
			req.setAttribute("msg", "原始密码输入不正确");
			return "frontend/password";
		}
		/*
		 *判断两次新密码是否一样 
		 */
		if(!newpassword.equals(renewpassword)){
			req.setAttribute("msg", "输入的两次新密码不一致！！！");
			return "frontend/password";
		}
		/*
		 * 更新密码
		 */
		userService.updateUserPassword(uid,newpassword);
		
		req.setAttribute("msg", "修改成功");
		return "frontend/password";
	}
	
	/**
	 * 用户添加一个新的收货地址
	 * @return
	 */
	
	@Autowired
	private IAddressService addressService;
	
	@RequestMapping("addAddress")
	public String addNewAddress(Addr address,HttpServletRequest req){
		addressService.insertAddress(address);
		return  "redirect:getAllAddress";
	}
	
	
	
	/**
	 * 查找信息通过uid
	 * @param uid
	 * @return
	 */
	@RequestMapping("/findUser")
	public String selectUserByUid(HttpServletRequest req){
		int uid = (Integer) req.getSession().getAttribute("uid");
		User resUser = userService.selectUserByUid(uid);
		req.getSession().setAttribute("user", resUser);
		return "redirect:/prod/init";
	}
	
	/*
	 * 修改头像
	 */
	@RequestMapping("/changeAvatar")
	public String changeAvatar(@RequestParam(value="avatarfile") CommonsMultipartFile file,HttpSession session){
		User user = (User) session.getAttribute("user");
		if(file.getSize()>0){
			user.setAvatar(FileTransferUtil.transfer(file,session));
		}
		userService.updateUser(user);
		return "frontend/information";
	}
}

