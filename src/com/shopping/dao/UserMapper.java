package com.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shopping.pojo.User;

public interface UserMapper {
	int deleteByPrimaryKey(Integer uid);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer uid);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	User selectPasswordByUidAndPassword(int uid, String oldpassword);

	User login(User record);
	
	List<User> selectAllUsers(@Param("pageStart")int pageStart,@Param("pageSize")int pageSize);
	
	User selectByUsername(String username);
	
	int findNum();
}