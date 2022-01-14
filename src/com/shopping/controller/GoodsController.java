package com.shopping.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopping.pojo.Product;
import com.shopping.service.IProductService;

/**
 * 商品controller
 * @author zz
 *
 */
@Controller
public class GoodsController {

	@Autowired
	private IProductService productService;
	
	@RequestMapping("/findProductById")
	public String findProductById(int id,HttpServletRequest req){
		Product product =  productService.findProductById(id);
		req.setAttribute("product", product);
		return "frontend/introduction";
	}
}


