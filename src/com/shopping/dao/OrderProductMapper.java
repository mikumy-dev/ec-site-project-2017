package com.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shopping.pojo.OrderProductPojo;

public interface OrderProductMapper {
	List<OrderProductPojo> findAllOrder(@Param("pageStart") int pageStart,@Param("pageSize") int pageSize);

	int findNum();
	
	int updateStatus(int id);
}
