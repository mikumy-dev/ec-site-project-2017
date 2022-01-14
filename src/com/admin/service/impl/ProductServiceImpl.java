package com.admin.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.service.IproductService;
import com.shopping.dao.ProductMapper;
import com.shopping.pojo.Product;
import com.shopping.pojo.User;
@Service
public class ProductServiceImpl implements IproductService{
	
	@Autowired
	private ProductMapper mapper;

	@Override
	public List<Product> findProduct(int pageStart, int pageSzie) {
		pageStart=(pageStart-1)*pageSzie;
		return mapper.findProduct(pageStart, pageSzie);
	}

	@Override
	public int findNum() {
		return mapper.findNum();
	}

	@Override
	public int insertSelective(Product record,User user) {
		record.setCreatedBy("admin");
		record.setCreatedDate(new Date());
		record.setLastUpdateBy("admin");
		record.setLastUpdateDate(new Date());
		
		return mapper.insertSelective(record);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return mapper.deleteByPrimaryKey(id);
	}

	@Override
	public Product selectByPrimaryKey(Integer id) {
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Product record,User user) {
		record.setLastUpdateBy(user.getUsername());
		record.setLastUpdateDate(new Date());
		return mapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByid(Product record) {
		return mapper.updateByid(record);
	}

}
