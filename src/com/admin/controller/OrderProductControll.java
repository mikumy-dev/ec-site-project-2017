package com.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.IorderProductService;
import com.admin.service.IproductService;
import com.shopping.bean.OrderPojo;
import com.shopping.pojo.OrderSchedule;
import com.shopping.pojo.Product;
import com.shopping.pojo.User;
import com.shopping.service.IOrderScheduleService;
import com.shopping.util.PageUtil;

@Controller
@RequestMapping(value="/orderProduct")
public class OrderProductControll {
	@Autowired
	private IorderProductService iorderProductService;
	@Autowired
	private IOrderScheduleService iOrderScheduleService;
	@Autowired
	private IproductService iproductService;
	public PageUtil pageUtil;
	@RequestMapping(value="/init")
	public String init(Model model,int pageNo){
		int totalCount = iorderProductService.findNum();
		pageUtil = new PageUtil(10, totalCount);

		if (pageNo != 0) {
			pageUtil.setPageNo(pageNo);
		}
		List<OrderPojo> orderPojos=iorderProductService.findAllOrder(pageUtil.getPageNo(), pageUtil.getPageSize());
		if (orderPojos != null && orderPojos.size() > 0) {
			pageUtil.setData(orderPojos);
			model.addAttribute("pageUtil", pageUtil);
		}
		
		return "backend/orderList";
	}
	
	@RequestMapping(value="updateStatus")
	public String updateStatus(int id){
		iorderProductService.updateStatus(id);
		List<OrderSchedule> orderSchedules=iOrderScheduleService.selectOrderScheduleByOrderId(id);
		if(orderSchedules!=null&&orderSchedules.size()>0){
			for(OrderSchedule schedule:orderSchedules){
				Product product=new Product();
				product.setInventory(schedule.getNum());
				product.setId(schedule.getProductid());
				iproductService.updateByid(product);
			}			
		}
		return "redirect:/orderProduct/init?pageNo=1";
	}
}
