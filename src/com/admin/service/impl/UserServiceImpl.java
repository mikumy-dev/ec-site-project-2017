package com.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.service.IUserService;
import com.shopping.dao.UserMapper;
import com.shopping.pojo.User;
@Service("adminService")
public class UserServiceImpl implements IUserService {
	@Autowired
	private UserMapper userMapper;
	@Override
	public User login(User user) {
		return userMapper.login(user);
	}
	@Override
	public List<User> selectAllUsers(int pageStart, int pageSize) {
		pageStart=(pageStart-1)*pageSize;
		return userMapper.selectAllUsers(pageStart, pageSize);
	}
	@Override
	public int insertSelective(User record) {
		return userMapper.insertSelective(record);
	}
	@Override
	public User selectByPrimaryKey(int uid) {
		return userMapper.selectByPrimaryKey(uid);
	}
	@Override
	public int updateByPrimaryKeySelective(User user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}
	@Override
	public int deleteByPrimaryKey(int id) {
		return userMapper.deleteByPrimaryKey(id);
	}
	@Override
	public int findNum() {
		return userMapper.findNum();
	}

}
