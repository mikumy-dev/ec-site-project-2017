package com.admin.service;

import java.util.List;

import com.shopping.bean.OrderPojo;

public interface IorderProductService {

	List<OrderPojo> findAllOrder(int pageStart, int pageSzie);
	
	int findNum();
	
	int updateStatus(int id);
}
