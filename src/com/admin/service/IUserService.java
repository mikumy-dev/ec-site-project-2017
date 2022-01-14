package com.admin.service;

import java.util.List;

import com.shopping.pojo.User;

public interface IUserService {
	User login(User user);
	
	List<User> selectAllUsers(int pageStart, int pageSize);
	
	int insertSelective(User record);
	
	User selectByPrimaryKey(int uid);
	
	int updateByPrimaryKeySelective(User user);
	
	int deleteByPrimaryKey(int id);
	
	int findNum();
}
