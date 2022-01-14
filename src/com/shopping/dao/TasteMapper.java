package com.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shopping.pojo.Taste;

public interface TasteMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Taste record);

    int insertSelective(Taste record);

    List<Taste> selectByPrimaryKey();
    
    Taste findByid(int id);
    
    int updateByPrimaryKeySelective(Taste record);

    int updateByPrimaryKey(Taste record);
    
    int findNum();
    
    List<Taste> findTaste(@Param("pageStart")int pageStart,@Param("pageSize")int pageEnd);
}