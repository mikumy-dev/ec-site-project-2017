package com.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shopping.pojo.Type;

public interface TypeMapper {
    int insertSelective(Type record);

    int updateByPrimaryKey(Type record);

	List<Type> selectList();
    
    int deleteByPrimaryKey(Integer id);

    int insert(Type record);

    Type selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Type record);
    
    List<Type> findType(@Param("pageStart")int pageStart,@Param("pageSize")int pageSize);
    
    int findNum();
}