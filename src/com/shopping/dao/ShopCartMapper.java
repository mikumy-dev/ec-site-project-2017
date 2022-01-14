package com.shopping.dao;

import java.util.List;
import java.util.Map;

import com.shopping.pojo.ShopCart;

public interface ShopCartMapper {

	int insert(ShopCart sc);
	
	List<ShopCart> selectByUserId(int userId);

	List<Map<String, Object>> findAllByUserId(int uid);

	int deleteById(int spid);
}
