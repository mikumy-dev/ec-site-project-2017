package com.shopping.dao;

import java.util.List;
import java.util.Map;

import com.shopping.bean.CollectionShow;
import com.shopping.pojo.Collection;

public interface CollectionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Collection record);

    int insertSelective(Collection record);

    Collection selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Collection record);

    int updateByPrimaryKey(Collection record);
    
    Collection checkIfCollected(Collection record);
    
    List<CollectionShow> selectByUserid(Map<String,Object> map);
    
    double countCollectionNumByUserId(Integer userid);
}