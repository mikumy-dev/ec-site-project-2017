package com.shopping.service;

import java.util.List;
import java.util.Map;

public interface IShopCartService {

	public static final String SERVICE_NAME = "com.shopping.service.impl.ShopCartServiceImpl";
	/**
	 * 
	 * @param userId
	 * @param pid
	 * @param qualtity
	 * @param price
	 * @param remark
	 * @return
	 */
	int addToShopCart(int userId,int pid, int qualtity, double price,String remark);
	/**
	 * 查询购物车
	 * @param uid
	 * @return
	 */
	List<Map<String, Object>> findAllByUserId(int uid);
	/**
	 * 删除
	 * @param spid
	 */
	void deleteById(int spid);
}
