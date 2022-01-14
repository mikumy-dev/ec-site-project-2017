package com.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shopping.bean.SearchCondition;
import com.shopping.bean.ShopCartOnPage;
import com.shopping.pojo.Product;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
    
    List<Product>  findProduct(@Param("pageStart")int pageStart,@Param("pageSize")int pageSize);
    
    int findNum();
    
    int findNumBySearchCondition(@Param("condition")SearchCondition condition);
    
    List<Product> findProductBySearchCondition(@Param("pageStart")int pageStart,@Param("pageSize")int pageSize, @Param("condition")SearchCondition condition);
        
    List<Product> findSelling();
    
    List<Product> findNewest();
    
    int updateByid(Product record);
    
    ShopCartOnPage findProductInShopCart(ShopCartOnPage shopCartOnPage);
}