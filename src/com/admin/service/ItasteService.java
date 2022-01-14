package com.admin.service;

import java.util.List;

import com.shopping.pojo.Taste;

public interface ItasteService {

    List<Taste> selectByPrimaryKey();
    
    Taste findByid(int id);
    
    List<Taste> findTaste(int pageStart, int pageSzie);
    
    int deleteByPrimaryKey(Integer id);

    int insert(Taste record);
    
    int findNum();
    
    int updateByPrimaryKeySelective(Taste record);
}
