package com.shopping.dao;

import java.util.List;

import com.shopping.pojo.Province;
/**
 * 
 * @author zz
 *
 */
public interface ProvinceMapper {

	/*
	 * 查询所有的省份
	 */
	List<Province> selectAll();
	/*
	 * 按省id查找省份
	 */
	Province selectById(int id);
}
