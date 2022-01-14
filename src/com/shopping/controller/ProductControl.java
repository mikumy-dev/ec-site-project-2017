package com.shopping.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.ItasteService;
import com.shopping.bean.SearchCondition;
import com.shopping.pojo.Product;
import com.shopping.pojo.Taste;
import com.shopping.pojo.Type;
import com.shopping.service.IProductService;
import com.shopping.service.ItypeService;
import com.shopping.util.PageUtil;

@Controller
@RequestMapping(value = "/prod")
public class ProductControl {
	@Autowired
	private ItypeService itypeService;
	@Autowired
	private IProductService iproductService;
	@Autowired
	private ItasteService itasteService;
	public PageUtil pageUtil;
	
	@RequestMapping(value = "/init")
	public String init(Model model){
		List<Type> types=itypeService.selectList();
		List<Product> sellingProducts=iproductService.findSelling();
		List<Product> newestProducts=iproductService.findNewest();
		model.addAttribute("types", types);
		model.addAttribute("sellingProducts", sellingProducts);
		model.addAttribute("newestProducts", newestProducts);
		return "frontend/index";
	}
	
	@RequestMapping("/findProductBySearchCondition")
	public String findProductBySearchCondition(Model model, SearchCondition condition, Integer pageNo, HttpSession session){
		/* 
		 * 搜索条件有productType和keyword，两者不能兼容，一次有值则另一个必须为null
		 * 第一次请求：用户输入搜索条件，排序方式恢复默认
		 * 第二次请求：用户输入排序方式，搜索条件不变，从session取得搜索条件
		 * 第三次请求：用户改变搜索条件，则直接获取用户输入，不必从session获取
		 * 
		 * 翻页的时候，搜索条件和排序方式不变，用户输入的condition==null
		 * 则从session获取用户之前的搜索条件
		 */
		
		//翻页的时候
		if(condition.getKeyword()==null && condition.getProductType()==null && condition.getOrderByCondition()==null){
			condition = (SearchCondition) session.getAttribute("condition");			
		}
		//判断有没有输入搜索条件
		else if(condition.getKeyword()==null && condition.getProductType()==null && condition.getOrderByCondition()!=null){
			
			//仅有排序方式输入，搜索条件没有输入，从session取得搜索条件
			SearchCondition oldCondition = (SearchCondition) session.getAttribute("condition");
			if(oldCondition.getKeyword()!=null){
				condition.setKeyword(oldCondition.getKeyword());
			}
			if(oldCondition.getProductType()!=null){
				condition.setProductType(oldCondition.getProductType());
			}			
		}
		//有输入搜索条件，则不做任何改变
		else{
			
		}		
		session.setAttribute("condition", condition);
		
		int totalCount = iproductService.findNumBySearchCondition(condition);
		pageUtil = new PageUtil(8, totalCount);
		
		if (pageNo != null) {
			pageUtil.setPageNo(pageNo);
		}else{
			pageUtil.setPageNo(1);
		}
		List<Product> products = iproductService.findProductBySearchCondition(
				pageUtil.getPageNo(), pageUtil.getPageSize(), condition);
		if (products != null && products.size() > 0) {
			pageUtil.setData(products);
			model.addAttribute("pageUtil", pageUtil);
		}
		
		return "frontend/search";
		
	}
	
	@RequestMapping("/findProductById")
	public String findProductById(int id,Model model){
		Product prod = iproductService.findProductById(id);
		List<Taste> tastes=new ArrayList<Taste>();
		if(prod.getTasteid()!=null){
			String a=prod.getTasteid();
			String[]b=a.split(",");
				for(int i=0;i<b.length;i++){
					if(b[i]!=null){
						Taste taste=itasteService.findByid(Integer.parseInt(b[i]));
						if(taste!=null){
							tastes.add(taste);
						}
					}
			}			
		}
		model.addAttribute("product", prod);
		model.addAttribute("tastes", tastes);
		return "frontend/introduction";
	}
}
