package com.shopping.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.bean.ProductPojo;
import com.shopping.dao.OrderScheduleMapper;
import com.shopping.pojo.OrderSchedule;
import com.shopping.service.IOrderScheduleService;
@Service
public class OrderScheduleServiceImpl implements IOrderScheduleService {

	@Autowired
	private OrderScheduleMapper orderScheduleMapper;
	@Override
	public int insertSelective(OrderSchedule record) {
		Date date = new Date();
		record.setCreatedBy("admin");
		record.setCreatedDate(date);
		record.setLastUpdateBy("admin");
		record.setLastUpdateDate(date);
		return orderScheduleMapper.insertSelective(record);
	}
	@Override
	public List<ProductPojo> selectProductPojoByOrderId(Integer orderid) {
		return orderScheduleMapper.selectProductPojoByOrderId(orderid);
	}
	@Override
	public List<OrderSchedule> selectOrderScheduleByOrderId(Integer orderid) {
		return orderScheduleMapper.selectOrderScheduleByOrderId(orderid);
	}

}
