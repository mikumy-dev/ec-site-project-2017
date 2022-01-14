package com.admin.service;

import java.util.List;

import com.shopping.pojo.Type;

public interface ItypesService {
	int deleteByPrimaryKey(Integer id);

	int insert(Type record);

	Type selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Type record);

	List<Type> findType(int pageStart, int pageSize);

	int findNum();
}
