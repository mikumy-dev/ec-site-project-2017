package com.admin.service;

import java.util.List;

import com.shopping.pojo.Product;
import com.shopping.pojo.User;

public interface IproductService {
	int findNum();

	List<Product> findProduct(int pageStart, int pageSzie);

	int insertSelective(Product record, User user);

	int deleteByPrimaryKey(Integer id);
	
	Product selectByPrimaryKey(Integer id);
	
	 int updateByPrimaryKeySelective(Product record,User user);
	 
	 int updateByid(Product record);
}
