package com.shopping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.bean.CollectionShow;
import com.shopping.bean.Page;
import com.shopping.pojo.Collection;
import com.shopping.service.ICollectionService;

@Controller
@RequestMapping("/collection")
public class CollectionController {

	@Autowired
	private ICollectionService collectionService;
	
	@RequestMapping("/addCollection")
	@ResponseBody
	public String addCollection(Collection collection){		
		if(collectionService.checkIfCollected(collection)==null){
			collectionService.insertSelective(collection);
			return "1";			
		}
		return "0";
	}
	
	@RequestMapping("/selectByUserid")
	public String selectByUserid(int userid,Model model, Integer pageNum){
		Page page = new Page();
		page.setTotalItems(collectionService.countCollectionNumByUserId(userid));
		page.setItemsOnPage(8);
		if (pageNum == null) {
			pageNum = 1;
		} else {
			if (pageNum < 1) {
				pageNum = 1;
			}
			if (pageNum > page.getTotalPages()) {
				pageNum = page.getTotalPages();
			}
		}
		page.setPageNum(pageNum);
		page.getPageDatas();
		page.setLimitFrom(page.getLimitFrom());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userid", userid);
		map.put("page", page);
		List<CollectionShow> collectionList = collectionService.selectByUserid(map);
		model.addAttribute("collectionList", collectionList);
		model.addAttribute("page", page);
		return "frontend/collection";
	}
	
	@RequestMapping("/delete")
	public String delete(int id){
		collectionService.deleteByPrimaryKey(id);
		return "redirect:/collection/selectByUserid";
	}
}
