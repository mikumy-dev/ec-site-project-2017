package com.shopping.service;

import com.shopping.pojo.User;

public interface IUserService {
	
	/*
	 * 登录
	 */
	User login(String userName,String password);
	/*
	 * 注册
	 */
	void insertUser(User user);
	/**
	 * 更新
	 * @param user
	 */
	void updateUser(User user);
	/**
	 * 通过uid查找user信息
	 * @param uid
	 * @return
	 */
	User selectUserByUid(int uid);
	/**
	 * 查找对应的uid的登录密码是否一致
	 * @param uid
	 * @param oldpassword
	 * @return
	 */
	boolean selectPasswordByUidAndPassword(int uid, String oldpassword);
	/**
	 * 更新密码
	 * @param uid
	 * @param newpassword
	 */
	void updateUserPassword(int uid, String newpassword);
	
	User selectByUsername(String username);
}
