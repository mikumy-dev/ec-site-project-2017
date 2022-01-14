package com.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.admin.service.ItypesService;
import com.shopping.pojo.Type;
import com.shopping.pojo.User;
import com.shopping.util.FileTransferUtil;
import com.shopping.util.PageUtil;

@Controller
@RequestMapping(value="/type")
public class TypeController {
	@Autowired
	private ItypesService itypesService;
	
	public PageUtil pageUtil;
	
	@RequestMapping(value="/init")
	public String init(Model model, int pageNo){
		int totalCount = itypesService.findNum();
		pageUtil = new PageUtil(5, totalCount);
		if (pageNo != 0) {
			pageUtil.setPageNo(pageNo);
		}
		List<Type> types = itypesService.findType(pageUtil.getPageNo(), pageUtil.getPageSize());
		if (types != null && types.size() > 0) {
			pageUtil.setData(types);
			model.addAttribute("pageUtil", pageUtil);
		}
		return "backend/typeList";	
	}
	
	@RequestMapping(value="/modifyType")
	public String modifyType(int id, Model model){
		Type type=itypesService.selectByPrimaryKey(id);
		model.addAttribute("type", type);	
		return "backend/typeModify";
	}
	@RequestMapping(value="/deleteType")
	public String deleteType(int id){
		itypesService.deleteByPrimaryKey(id);
		return "redirect:/type/init?pageNo=1";
	}
	
	@RequestMapping(value="/saveType")
	public String saveType(Type type,HttpSession session,@RequestParam(value = "iconpaths", required = false) CommonsMultipartFile file){
		User user = (User) session.getAttribute("reuser");
		type.setCreatedBy(user.getUsername());
//		type.setCreatedBy("admin");
		type.setCreatedDate(new Date());
		type.setLastUpdateBy(user.getUsername());
//		type.setLastUpdateBy("admin");
		type.setLastUpdateDate(new Date());
		if(file.getSize()>0){
			type.setIconpath(FileTransferUtil.transfer(file, session));
		}
		if(type.getId()==null||type.getId()==0){
			int i=itypesService.insert(type);
			if(i>0){
				return "redirect:/type/init?pageNo=1";
			}else {
				return "backend/typeAdd";
			}
		}else {
			int i=itypesService.updateByPrimaryKeySelective(type);
			if(i>0){
				return "redirect:/type/init?pageNo=1";
			}else {
				return "redirect:/type/modifyType?id="+type.getId();
			}
			
		}
	}

}
