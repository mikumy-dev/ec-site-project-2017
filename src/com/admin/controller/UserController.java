package com.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.admin.service.IUserService;
import com.shopping.pojo.User;
import com.shopping.util.CommonUtils;
import com.shopping.util.FileTransferUtil;
import com.shopping.util.PageUtil;


@Controller
@RequestMapping("/adminuser")
public class UserController {
	@Autowired
	private IUserService adminService;
	
	private PageUtil pageUtil;
	@RequestMapping("/adminlogin")
	public String adminlogin(User user,HttpSession session){
		user.setLoginpwd(CommonUtils.toMD5(user.getLoginpwd()));
		User reuser = adminService.login(user);
		if(reuser!=null && reuser.getRole().equals("admin")){	
			session.setAttribute("reuser", reuser);
			return "redirect:/adminuser/selectAllUsers?pageNo=1";			
		}else{			
			return "backend/login";
		}
	}
	
	@RequestMapping("/selectAllUsers")
	public String selectAllUsers(Model model,int pageNo){
		int totalCount = adminService.findNum();
		pageUtil = new PageUtil(5, totalCount);
		if (pageNo != 0) {
			pageUtil.setPageNo(pageNo);
		}
		List<User> userList = adminService.selectAllUsers(pageUtil.getPageNo(), pageUtil.getPageSize());
		if (userList != null && userList.size() > 0) {
			pageUtil.setData(userList);
			model.addAttribute("pageUtil", pageUtil);
		}
		return "backend/userList";
	}
	@RequestMapping(value="saveUser")
	public String saveUser(User user,HttpSession session){
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//		User user2=(User) session.getAttribute("reuser");
//		user.setLastUpdateBy(user2.getUsername());
		user.setLoginpwd(CommonUtils.toMD5(user.getLoginpwd())); //md5 加密
		user.setLastUpdateDate(sf.format(new Date()));
		int i= adminService.updateByPrimaryKeySelective(user);
		if(i>0){
			return "redirect:/adminuser/selectAllUsers?pageNo=1";
		}else {
			return "redirect:/adminuser/findByid?id="+user.getUid();
		}
	}
	@RequestMapping(value="deleteByid")
	public String deleteByid(int id){
		adminService.deleteByPrimaryKey(id);
		return "redirect:/adminuser/selectAllUsers?pageNo=1";
	}
	
	@RequestMapping("/addUser")
	public String addUser(HttpSession session,User user,
			@RequestParam(value="avatarfile",required=false) CommonsMultipartFile file			
			){

		user.setLoginpwd(CommonUtils.toMD5(user.getLoginpwd())); //md5 加密
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		user.setCreatedBy("admin");
		user.setCreatedDate(format.format(date));
		user.setLastUpdateBy("admin");
		user.setLastUpdateDate(format.format(date));
		user.setStatus("1");
		if(file.getSize()>0){
			user.setAvatar(FileTransferUtil.transfer(file,session));
		}      
		adminService.insertSelective(user);
		return "redirect:/adminuser/selectAllUsers?pageNo=1";
	}
	
	@RequestMapping("findByid")
	public String findByid(int id,Model model){
		User user=adminService.selectByPrimaryKey(id);
		model.addAttribute("user", user);
		return "backend/userModify";
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest req){
		req.getSession(true).invalidate();
		return "backend/login";
	}
	
	
}