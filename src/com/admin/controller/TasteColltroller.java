package com.admin.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.ItasteService;
import com.shopping.pojo.Taste;
import com.shopping.pojo.User;
import com.shopping.util.PageUtil;

@Controller
@RequestMapping(value="/taste")
public class TasteColltroller {
	@Autowired
	private ItasteService itasteService;
	
	public PageUtil pageUtil;
	
	@RequestMapping(value="/init")
	public String init(Model model, int pageNo){
		int totalCount = itasteService.findNum();
		pageUtil = new PageUtil(5, totalCount);
		if (pageNo != 0) {
			pageUtil.setPageNo(pageNo);
		}
		List<Taste> tastes = itasteService.findTaste(pageUtil.getPageNo(), pageUtil.getPageSize());
		if (tastes != null && tastes.size() > 0) {
			pageUtil.setData(tastes);
			model.addAttribute("pageUtil", pageUtil);
		}
		return "backend/tasteList";	
	}
	
	@RequestMapping(value="/modifyTaste")
	public String modifyTaste(int id, Model model){
		Taste taste=itasteService.findByid(id);
		model.addAttribute("taste", taste);	
		return "backend/tasteModify";
	}
	@RequestMapping(value="/deleteTaste")
	public String deleteTaste(int id){
		itasteService.deleteByPrimaryKey(id);
		return "redirect:/taste/init?pageNo=1";
	}
	
	@RequestMapping(value="/saveTaste")
	public String saveTaste(Taste taste,HttpSession session){
		User user = (User) session.getAttribute("reuser");
		taste.setCreatedBy(user.getUsername());
		taste.setCreatedDate(new Date());
		taste.setLastUpdateBy(user.getUsername());
		taste.setLastUpdateDate(new Date());
		if(taste.getId()==null||taste.getId()==0){
			int i=itasteService.insert(taste);
			if(i>0){
				return "redirect:/taste/init?pageNo=1";
			}else {
				return "backend/tasteAdd";
			}
		}else {
			int i=itasteService.updateByPrimaryKeySelective(taste);
			if(i>0){
				return "redirect:/taste/init?pageNo=1";
			}else {
				return "redirect:/taste/modifyTaste?id="+taste.getId();
			}
			
		}
		
		
	}
}
