package com.admin.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.service.IorderProductService;
import com.shopping.bean.OrderPojo;
import com.shopping.bean.ProductPojo;
import com.shopping.dao.OrderProductMapper;
import com.shopping.pojo.OrderProductPojo;
@Service
public class OrderProductServiceImpl implements IorderProductService {
	@Autowired
	private OrderProductMapper orderProductMapper;
	
	@Override
	public List<OrderPojo> findAllOrder(int pageStart, int pageSzie) {
		pageStart=(pageStart-1)*pageSzie;
		List<OrderPojo> list=new ArrayList<OrderPojo>();
		List<OrderProductPojo> pojos=orderProductMapper.findAllOrder(pageStart,pageSzie);
		if(pojos.size()>0){
			for(OrderProductPojo orderProductPojo:pojos){
				boolean falg=false;
				OrderPojo orderPojo=new OrderPojo();
				List<ProductPojo> productPojos=new ArrayList<ProductPojo>();
				ProductPojo productPojo=new ProductPojo();
				if(list.size()>0){
					for(OrderPojo Pojo:list){
						if(orderProductPojo.getId()==Pojo.getId()){
							productPojo.setProductName(orderProductPojo.getProductName());
							productPojo.setPrice(orderProductPojo.getPrice());
							productPojo.setNum(orderProductPojo.getNum());
							productPojo.setTasteName(orderProductPojo.getTasteName());
							productPojos.addAll(Pojo.getList());
							productPojos.add(productPojo);
							Pojo.setList(productPojos);
							falg=false;
							break;
						}else {
							falg=true;
						}
					}
					if (falg) {
						orderPojo.setId(orderProductPojo.getId());
						orderPojo.setOrderNum(orderProductPojo.getOrderNum());
						orderPojo.setRealname(orderProductPojo.getRealname());
						orderPojo.setAddr(orderProductPojo.getAddr());
						orderPojo.setTurnoverTime(orderProductPojo.getTurnoverTime());
						orderPojo.setStatus(orderProductPojo.getStatus());
						productPojo.setProductName(orderProductPojo.getProductName());
						productPojo.setPrice(orderProductPojo.getPrice());
						productPojo.setNum(orderProductPojo.getNum());
						productPojo.setTasteName(orderProductPojo.getTasteName());
						productPojos.add(productPojo);
						orderPojo.setList(productPojos);
						list.add(orderPojo);
					}
				}else {
					orderPojo.setId(orderProductPojo.getId());
					orderPojo.setOrderNum(orderProductPojo.getOrderNum());
					orderPojo.setRealname(orderProductPojo.getRealname());
					orderPojo.setAddr(orderProductPojo.getAddr());
					orderPojo.setTurnoverTime(orderProductPojo.getTurnoverTime());
					orderPojo.setStatus(orderProductPojo.getStatus());
					productPojo.setProductName(orderProductPojo.getProductName());
					productPojo.setPrice(orderProductPojo.getPrice());
					productPojo.setNum(orderProductPojo.getNum());
					productPojo.setTasteName(orderProductPojo.getTasteName());
					productPojos.add(productPojo);
					orderPojo.setList(productPojos);
					list.add(orderPojo);
				}
			}
			
		}
		return list;
	}

	@Override
	public int findNum() {
		return orderProductMapper.findNum();
	}

	@Override
	public int updateStatus(int id) {
		return orderProductMapper.updateStatus(id);
	}

}
