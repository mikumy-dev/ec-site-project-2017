package com.shopping.service;

import java.util.List;

import com.shopping.bean.SearchCondition;
import com.shopping.bean.ShopCartOnPage;
import com.shopping.pojo.Product;

public interface IProductService {
	
	public static final String SERVICE_NAME = "com.shopping.service.impl.ProductServiceImpl";
	
	/**
	 * 查询商品详情根据商品id
	 * @param id  商品id
	 * @return
	 */
	Product findProductById(int id);
	
	List<Product>  findProduct(int pageStart,int pageEnd);
    
    int findNum();
    
    int findNumBySearchCondition(SearchCondition condition);
    
    List<Product> findProductBySearchCondition(int pageStart,int pageEnd,SearchCondition condition);
    	
	List<Product> findSelling();
	
	List<Product> findNewest();
	
	ShopCartOnPage findProductInShopCart(ShopCartOnPage shopCartOnPage);

}
