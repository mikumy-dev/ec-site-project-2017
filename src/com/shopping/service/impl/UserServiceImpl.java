package com.shopping.service.impl;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.UserMapper;
import com.shopping.pojo.User;
import com.shopping.service.IUserService;
import com.shopping.util.CommonUtils;


@Service("userService")
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public User login(String userName, String password) {
		User user = new User();
		user.setUsername(userName);
		user.setLoginpwd(password);
		return userMapper.login(user);
	}
	
	@Override
	public void insertUser(User user) {		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String datestr = format.format(date);
		user.setStatus("1");
		user.setRole("user");
		user.setCreatedBy(user.getUsername());
		user.setCreatedDate(datestr);
		user.setLastUpdateBy(user.getUsername());
		user.setLastUpdateDate(datestr);
		userMapper.insertSelective(user);
	}
	
	@Override
	public void updateUser(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}
	
	@Override
	public User selectUserByUid(int uid) {
		return userMapper.selectByPrimaryKey(uid);
	}
	
	
	@Override
	public boolean selectPasswordByUidAndPassword(int uid, String oldpassword) {
		oldpassword = CommonUtils.toMD5(oldpassword); //加密
		User res = userMapper.selectPasswordByUidAndPassword(uid,oldpassword);
		if(res == null){
			return false;
		}
		return true;
	}
	
	@Override
	public void updateUserPassword(int uid, String newpassword) {
		User user = new User();
		user.setUid(uid);
		user.setLoginpwd(CommonUtils.toMD5(newpassword)); //加密
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public User selectByUsername(String username) {
		return userMapper.selectByUsername(username);
	}
}

