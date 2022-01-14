package com.shopping.service;

import java.util.List;
import java.util.Map;

import com.shopping.bean.CollectionShow;
import com.shopping.pojo.Collection;

public interface ICollectionService {

	int insertSelective(Collection record);
	
	Collection checkIfCollected(Collection record);
	
	List<CollectionShow> selectByUserid(Map<String,Object> map);
	
	double countCollectionNumByUserId(Integer userid);
	
	int deleteByPrimaryKey(int id);
}
