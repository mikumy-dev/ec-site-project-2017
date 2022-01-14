package com.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.service.ItypesService;
import com.shopping.dao.TypeMapper;
import com.shopping.pojo.Type;
@Service
public class TypesServiceImpl implements ItypesService{
	@Autowired
	private TypeMapper typeMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return typeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Type record) {
		return typeMapper.insert(record);
	}

	@Override
	public Type selectByPrimaryKey(Integer id) {
		return typeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Type record) {
		return typeMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<Type> findType(int pageStart, int pageSize) {
		pageStart=(pageStart-1)*pageSize;
		return typeMapper.findType(pageStart, pageSize);
	}

	@Override
	public int findNum() {
		return typeMapper.findNum();
	}

}
