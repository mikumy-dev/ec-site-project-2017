package com.shopping.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.TypeMapper;
import com.shopping.pojo.Type;
import com.shopping.service.ItypeService;

@Service
public class TypeServiceImpl implements ItypeService{
	@Autowired
	private TypeMapper map;
	
	@Override
	public List<Type> selectList() {
		return map.selectList();
	}


}
