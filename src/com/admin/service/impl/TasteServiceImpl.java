package com.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.service.ItasteService;
import com.shopping.dao.TasteMapper;
import com.shopping.pojo.Taste;
@Service
public class TasteServiceImpl implements ItasteService{
	@Autowired
	private TasteMapper tasteMapper;
	
	@Override
	public List<Taste> selectByPrimaryKey() {
		return tasteMapper.selectByPrimaryKey();
	}

	@Override
	public Taste findByid(int id) {
		return tasteMapper.findByid(id);
	}
	
	@Override
	public List<Taste> findTaste(int pageStart, int pageSzie) {
		pageStart=(pageStart-1)*pageSzie;
		return tasteMapper.findTaste(pageStart, pageSzie);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return tasteMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Taste record) {
		return tasteMapper.insert(record);
	}

	@Override
	public int updateByPrimaryKeySelective(Taste record) {
		return tasteMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int findNum() {
		return tasteMapper.findNum();
	}

}
