package com.shopping.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.bean.CollectionShow;
import com.shopping.dao.CollectionMapper;
import com.shopping.pojo.Collection;
import com.shopping.service.ICollectionService;
@Service("collectionService")
public class CollectionServiceImpl implements ICollectionService {

	@Autowired
	private CollectionMapper collectionMapper;
	
	@Override
	public int insertSelective(Collection record) {
		Date date = new Date();
		record.setCreatedDate(date);
		record.setLastUpdateBy(record.getCreatedBy());
		record.setLastUpdateDate(date);
		return collectionMapper.insertSelective(record);
	}

	@Override
	public Collection checkIfCollected(Collection record) {
		return collectionMapper.checkIfCollected(record);
	}

	@Override
	public List<CollectionShow> selectByUserid(Map<String,Object> map) {
		return collectionMapper.selectByUserid(map);
	}

	@Override
	public double countCollectionNumByUserId(Integer userid) {
		return collectionMapper.countCollectionNumByUserId(userid);
	}

	@Override
	public int deleteByPrimaryKey(int id) {
		return collectionMapper.deleteByPrimaryKey(id);
	}
	
}
