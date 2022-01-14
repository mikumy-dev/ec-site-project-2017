package com.shopping.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.shopping.pojo.Addr;
import com.shopping.pojo.Area;
import com.shopping.pojo.City;
import com.shopping.pojo.Province;
import com.shopping.pojo.User;
import com.shopping.service.IAddressService;

/**
 * 地址相关的controller
 * @author zz
 *
 */
@Controller
@RequestMapping("/address")
public class AddressController {
	
	@Autowired
	private IAddressService addressService;
	
	/**
	 * 用户新添加收货地址
	 * @return  
	 */
	@RequestMapping("addAddr")
	public String addAddr(Addr addr,HttpServletRequest req){
		addressService.insertAddress(addr);
		req.setAttribute("addrmsg", "添加地址成功");
		return "redirect:/address/getAllAddress";
	}
	
	
	
	@ResponseBody
	@RequestMapping("getProvinces")
	public void selectAllProvince(HttpServletResponse resp){
		List<Province> list = addressService.selectAllProvince();
		String jsonProvince = JSON.toJSONString(list);
		try {
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write(jsonProvince);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查找城市，根据省份
	 * @param provinceId
	 */
	@ResponseBody
	@RequestMapping("getCityByProvinceId")
	public void selectCityByProvinceId(int provinceId,HttpServletResponse resp){
		List<City> list = addressService.selectCityByProvinceId(provinceId);
		String jsonCity = JSON.toJSONString(list);
		try {
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write(jsonCity);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查找地区根据城市
	 * @param cityId
	 * @param resp
	 */
	@ResponseBody
	@RequestMapping("getAreaByCityId")
	public void selectAreaByCityId(int cityId,HttpServletResponse resp){
		List<Area> list = addressService.selectAreaByCityId(cityId);
		String jsonArea = JSON.toJSONString(list);
		try {
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write(jsonArea);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询某个用户的所有的收货地址
	 * @param userId
	 * @param resp
	 */
	@RequestMapping("getAllAddress")
	public String selectAllAddressByUserId(HttpServletRequest req){
		User user = (User) req.getSession().getAttribute("user");
		List<Map<String,Object>> list = addressService.selectAllAddrByUserId(user.getUid());
		req.setAttribute("addressList", list);
		
		return "frontend/address";
	}

	/**
	 * 删除用户的一个收货地址
	 * @param id
	 */
	@RequestMapping("deleteAddress")
	public String delAddress(int aid,HttpServletRequest req){
		User user = (User) req.getSession().getAttribute("user");
		int uid = user.getUid();
		addressService.delAddressById(aid,uid);
		return "redirect:getAllAddress";
	}
	
	/*
	 * 更新
	 */
	@RequestMapping("editAddr")
	public String updateAddr(int id,Model model){
		Addr addr = addressService.selectAddrById(id);
		model.addAttribute("addr", addr);
		return "frontend/addressedit";
	}
	
	@RequestMapping("update")
	public String update(Addr addr){
		addressService.update(addr);
		return "redirect:getAllAddress";
	}
}
