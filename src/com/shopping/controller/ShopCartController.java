package com.shopping.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.bean.ShopCartOnPage;
import com.shopping.service.IProductService;

@Controller
@RequestMapping(value="/shopcart")
public class ShopCartController {

	@Autowired
	private IProductService productService;
	
	private List<ShopCartOnPage> shopcartList = new ArrayList<ShopCartOnPage>();
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/addToShopCart")
	@ResponseBody
	public String addToShopCart(ShopCartOnPage shopCartOnPage, HttpSession session){
		boolean flag=false;
		if(session.getAttribute("shopcartList")!=null){
			shopcartList = (List<ShopCartOnPage>) session.getAttribute("shopcartList");
		}
		if(shopcartList.size()>0){
			for(ShopCartOnPage shopcart:shopcartList){
				if(shopcart.getPid().equals(shopCartOnPage.getPid()) 
						&& shopcart.getTasteid().equals(shopCartOnPage.getTasteid())){
					flag=true;
					shopcart.setQuantity(shopcart.getQuantity()+shopCartOnPage.getQuantity());
				}
			}		
		}
		if(!flag){
			shopcartList.add(shopCartOnPage);			
		}
		
		session.setAttribute("shopcartList", shopcartList);
		return "1";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/findall")
	public String findAllByUserId(HttpSession session){
		if(session.getAttribute("shopcartList")!=null){
			shopcartList = (List<ShopCartOnPage>) session.getAttribute("shopcartList");
		}
		
		List<ShopCartOnPage> shopcartListOnPage = new ArrayList<ShopCartOnPage>();
		
		for(ShopCartOnPage shopcart:shopcartList){
			ShopCartOnPage shopCartOnPage = productService.findProductInShopCart(shopcart);
			shopCartOnPage.setQuantity(shopcart.getQuantity());
			shopCartOnPage.setTotalPrice(shopCartOnPage.getTotalPrice());
			shopcartListOnPage.add(shopCartOnPage);
		}
		
		session.setAttribute("shopcartListOnPage", shopcartListOnPage);
		return "frontend/shopcart";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/delete")
	public String delete(Integer pid, Integer tasteid, HttpSession session){		
		shopcartList = (List<ShopCartOnPage>) session.getAttribute("shopcartList");
		List<ShopCartOnPage> shopcartListOnPage = (List<ShopCartOnPage>) session.getAttribute("shopcartListOnPage");
		Integer j=null;
		for(int i=0; i<shopcartList.size(); i++){
			if(shopcartList.get(i).getPid().equals(pid) && shopcartList.get(i).getTasteid().equals(tasteid)){
				j=i;
			}			
		}
		if(j!=null){
			shopcartList.remove(shopcartList.get(j));
			shopcartListOnPage.remove(shopcartListOnPage.get(j));
		}
		session.setAttribute("shopcartList", shopcartList);
		session.setAttribute("shopcartListOnPage", shopcartListOnPage);
		return "redirect:/shopcart/findall";
	}
}
