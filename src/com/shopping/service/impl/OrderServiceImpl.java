package com.shopping.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.bean.OrderPojo;
import com.shopping.dao.OrderMapper;
import com.shopping.pojo.Order;
import com.shopping.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public int insertOrderAndGetID(Order record) {
		long time = new Date().getTime();
		record.setOrdernum(Long.toString(time));
		record.setStatus("1");
		return orderMapper.insertOrderAndGetID(record);
	}

	@Override
	public int updateByPrimaryKeySelective(Order record) {
		return orderMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public Order selectByPrimaryKey(Integer id) {
		return orderMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<OrderPojo> selectOrderPojoByUserId(Map<String,Object> map) {
		return orderMapper.selectOrderPojoByUserId(map);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return orderMapper.deleteByPrimaryKey(id);
	}

	@Override
	public OrderPojo selectOrderPojoById(Integer id) {
		return orderMapper.selectOrderPojoById(id);
	}

	@Override
	public int updateStatus(Order record) {
		return orderMapper.updateStatus(record);
	}

	@Override
	public double countOrderNumByUserId(Order record) {
		return orderMapper.countOrderNumByUserId(record);
	}
	

}
