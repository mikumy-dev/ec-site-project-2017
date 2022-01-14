package com.shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.bean.OrderPojo;
import com.shopping.bean.Page;
import com.shopping.bean.ProductPojo;
import com.shopping.bean.ShopCartOnPage;
import com.shopping.pojo.Addr;
import com.shopping.pojo.Order;
import com.shopping.pojo.OrderSchedule;
import com.shopping.pojo.User;
import com.shopping.service.IAddressService;
import com.shopping.service.IOrderScheduleService;
import com.shopping.service.IOrderService;
import com.shopping.service.IProductService;


@RequestMapping("/order")
@Controller
public class OrderController {
	
	@Autowired
	private IAddressService addressService;
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IOrderScheduleService orderScheduleService;
	
	@Autowired
	private IProductService productService;
	
	//购物车结算，生成订单，清空购物车
	@ResponseBody
	@RequestMapping(value="/shopcartOrder")
	public String shopcartOrder(@RequestBody List<OrderSchedule> orderScheduleList, HttpSession session, Model model){
		User user = (User) session.getAttribute("user");
		Order order = new Order();
		order.setUserid(user.getUid());		
		//insert一条订单并返回订单id
		int orderid = orderService.insertOrderAndGetID(order);
		session.setAttribute("orderid", orderid);
		for(OrderSchedule orderSchedule:orderScheduleList){
			orderSchedule.setOrderid(orderid);
			orderScheduleService.insertSelective(orderSchedule);
		}
		//获取地址列表
		List<Map<String, Object>> addrList = addressService.selectAllAddrByUserId(user.getUid());
		session.setAttribute("addrList", addrList);
		
		//获取订单商品列表
		List<ShopCartOnPage> shopcartListOnPage = new ArrayList<ShopCartOnPage>();
		for(OrderSchedule schedule:orderScheduleList){
			ShopCartOnPage shopcart = new ShopCartOnPage();
			shopcart.setPid(schedule.getProductid());
			shopcart.setTasteid(schedule.getTaste());
			shopcart.setQuantity(schedule.getNum());
			ShopCartOnPage shopCartOnPage = productService.findProductInShopCart(shopcart);
			shopCartOnPage.setQuantity(shopcart.getQuantity());
			shopCartOnPage.setTotalPrice(shopCartOnPage.getTotalPrice());
			shopcartListOnPage.add(shopCartOnPage);
		}
		session.setAttribute("orderProductListOnPage", shopcartListOnPage);
		session.removeAttribute("shopcartList");
		session.removeAttribute("shopcartListOnPage");
		return null;
	}
	//选择地址，并支付
	@ResponseBody
	@RequestMapping("/pay")
	public String pay(int addrid, Double sum, HttpSession session, Model model){
		int orderid = (Integer) session.getAttribute("orderid");
		Order order = orderService.selectByPrimaryKey(orderid);
		order.setAddrid(addrid);
		order.setStatus("2");
		orderService.updateByPrimaryKeySelective(order);
		Addr addr = addressService.selectAddrById(addrid);
		session.setAttribute("addr1", addr);
		session.setAttribute("sum", sum);
		session.removeAttribute("addrList");
		session.removeAttribute("orderProductListOnPage");
		return null;
	}
	//查找用户所有的订单
	@RequestMapping("/findOrderByUserId")
	public String findOrderByUserId(HttpSession session,String status,Integer pageNum, Model model){
		User user = (User) session.getAttribute("user");
		/*
		 * 1.通过userid找出所有的order，包括id, ordernum, turnover_time, status
		 * 2.找出每个orderid对应的order_schedule表(productid,taste,num)
		 * 3.通过order_schedule的商品id、口味id找出对应的商品图片、商品名称、口味名称、单价
		 * 4.需要展示订单编号、成交时间、订单状态、List(商品图片、商品名称、单价、数量、口味)
		 */
		Order order = new Order();
		order.setUserid(user.getUid());
		if("0".equals(status)){
			status=null;
		}
		order.setStatus(status);		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("order", order);
		Page page = new Page();
		page.setTotalItems(orderService.countOrderNumByUserId(order));
		page.setItemsOnPage(5);
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
		map.put("page", page);
		List<OrderPojo> orderPojoList = orderService.selectOrderPojoByUserId(map);
		
		for(OrderPojo orderPojo:orderPojoList){
			List<ProductPojo> productPojoList = orderScheduleService.selectProductPojoByOrderId(orderPojo.getId());
			orderPojo.setList(productPojoList);
		}
		
		model.addAttribute("orderPojoList", orderPojoList);
		model.addAttribute("statusTag", status);
		model.addAttribute("page", page);
		return "frontend/order";
	}
	
	//在订单管理处去支付
	@RequestMapping("/gotopay")
	public String gotopay(int id,HttpSession session){
		session.setAttribute("orderid", id);
		User user = (User) session.getAttribute("user");
		//获取地址列表
		List<Map<String, Object>> addrList = addressService.selectAllAddrByUserId(user.getUid());
		session.setAttribute("addrList", addrList);
		//通过orderid查找订单商品列表
		List<OrderSchedule> orderScheduleList = orderScheduleService.selectOrderScheduleByOrderId(id);
		
		List<ShopCartOnPage> shopcartListOnPage = new ArrayList<ShopCartOnPage>();
		//获取订单商品列表
		for(OrderSchedule schedule:orderScheduleList){
			ShopCartOnPage shopcart = new ShopCartOnPage();
			shopcart.setPid(schedule.getProductid());
			shopcart.setTasteid(schedule.getTaste());
			shopcart.setQuantity(schedule.getNum());
			ShopCartOnPage shopCartOnPage = productService.findProductInShopCart(shopcart);
			shopCartOnPage.setQuantity(shopcart.getQuantity());
			shopCartOnPage.setTotalPrice(shopCartOnPage.getTotalPrice());
			shopcartListOnPage.add(shopCartOnPage);
		}
		session.setAttribute("orderProductListOnPage", shopcartListOnPage);
		return "frontend/pay";
	}
	
	//查看订单详情
	@RequestMapping("/showOrderDetail")
	public String showOrderDetail(int id, Model model){
		OrderPojo orderPojo = orderService.selectOrderPojoById(id);
		Addr addr = addressService.selectAddrById(orderPojo.getAddrid());
		model.addAttribute("addr1", addr);
		List<ProductPojo> productPojoList = orderScheduleService.selectProductPojoByOrderId(id);
		orderPojo.setList(productPojoList);
		model.addAttribute("orderPojo", orderPojo);
		return "frontend/orderinfo";
	}
	//删除订单
	@RequestMapping("/delete")
	public String delete(int id){
		orderService.deleteByPrimaryKey(id);
		return "redirect:/order/findOrderByUserId";
	}
	//改变订单状态
	@RequestMapping("updateStatus")
	public String updateStatus(Order order){
		orderService.updateStatus(order);
		return "redirect:/order/findOrderByUserId";
	}
	
	@RequestMapping("/commentGoodsInOrder")
	public String commentGoodsInOrder(int id,HttpSession session,Model model){
		OrderPojo orderPojo = orderService.selectOrderPojoById(id);
		List<ProductPojo> productPojoList = orderScheduleService.selectProductPojoByOrderId(id);
		orderPojo.setList(productPojoList);
		model.addAttribute("orderPojo", orderPojo);
		session.setAttribute("orderid", id);
		return "frontend/commentlist";
	}
}
