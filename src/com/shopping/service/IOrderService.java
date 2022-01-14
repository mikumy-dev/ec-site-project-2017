package com.shopping.service;

import java.util.List;
import java.util.Map;

import com.shopping.bean.OrderPojo;
import com.shopping.pojo.Order;


public interface IOrderService {

	int insertOrderAndGetID(Order record);
	
	int updateByPrimaryKeySelective(Order record);
	
	Order selectByPrimaryKey(Integer id);
	
	List<OrderPojo> selectOrderPojoByUserId(Map<String,Object> map);
	
	int deleteByPrimaryKey(Integer id);
	
	OrderPojo selectOrderPojoById(Integer id);
	
	int updateStatus(Order record);
	
	double countOrderNumByUserId(Order record);
}
