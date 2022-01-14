package com.shopping.dao;

import java.util.List;

import com.shopping.bean.ProductPojo;
import com.shopping.pojo.OrderSchedule;

public interface OrderScheduleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderSchedule record);

    int insertSelective(OrderSchedule record);

    OrderSchedule selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderSchedule record);

    int updateByPrimaryKey(OrderSchedule record);
    
    List<ProductPojo> selectProductPojoByOrderId(Integer orderid);
    
    List<OrderSchedule> selectOrderScheduleByOrderId(Integer orderid);
}