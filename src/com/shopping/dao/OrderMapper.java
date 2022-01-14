package com.shopping.dao;

import java.util.List;
import java.util.Map;

import com.shopping.bean.OrderPojo;
import com.shopping.pojo.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    int insertOrderAndGetID(Order record);
    
    List<OrderPojo> selectOrderPojoByUserId(Map<String,Object> map);
    
    OrderPojo selectOrderPojoById(Integer id);
    
    int updateStatus(Order record);
    
    double countOrderNumByUserId(Order record);
}