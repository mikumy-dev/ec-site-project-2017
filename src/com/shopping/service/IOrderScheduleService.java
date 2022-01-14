package com.shopping.service;

import java.util.List;

import com.shopping.bean.ProductPojo;
import com.shopping.pojo.OrderSchedule;

public interface IOrderScheduleService {

	int insertSelective(OrderSchedule record);
	
	List<ProductPojo> selectProductPojoByOrderId(Integer orderid);
	
	List<OrderSchedule> selectOrderScheduleByOrderId(Integer orderid);
}
