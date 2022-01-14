package com.shopping.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.bean.SearchCondition;
import com.shopping.bean.ShopCartOnPage;
import com.shopping.dao.ProductMapper;
import com.shopping.pojo.Product;
import com.shopping.service.IProductService;

@Service(value=IProductService.SERVICE_NAME)
public class ProductServiceImpl implements IProductService{
	
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public Product findProductById(int id) {
		return productMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Product> findProduct(int pageStart, int pageSize) {
		pageStart=(pageStart-1)*pageSize;
		return productMapper.findProduct(pageStart, pageSize);
	}

	@Override
	public int findNum() {
		return productMapper.findNum();
	}

	@Override
	public List<Product> findProductBySearchCondition(int pageStart, int pageSize, SearchCondition condition) {
		pageStart=(pageStart-1)*pageSize;
		return productMapper.findProductBySearchCondition(pageStart, pageSize, condition);
	}
	
	@Override
	public List<Product> findSelling() {
		return productMapper.findSelling();
	}

	@Override
	public List<Product> findNewest() {
		return productMapper.findNewest();
	}

	@Override
	public int findNumBySearchCondition(SearchCondition condition) {
		return productMapper.findNumBySearchCondition(condition);
	}

	@Override
	public ShopCartOnPage findProductInShopCart(ShopCartOnPage shopCartOnPage) {
		return productMapper.findProductInShopCart(shopCartOnPage);
	}
}
