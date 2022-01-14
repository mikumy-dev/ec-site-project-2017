package com.shopping.bean;

import java.util.List;



public class OrderPojo {
	private int id;
	private String orderNum;
	private String realname;
	private String turnoverTime;
	private String addr;
	private Integer addrid;
	private String status;
	private List<ProductPojo> list;
	
	public Integer getAddrid() {
		return addrid;
	}
	public void setAddrid(Integer addrid) {
		this.addrid = addrid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getTurnoverTime() {
		return turnoverTime;
	}
	public void setTurnoverTime(String turnoverTime) {
		this.turnoverTime = turnoverTime;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public List<ProductPojo> getList() {
		return list;
	}
	public void setList(List<ProductPojo> list) {
		this.list = list;
	}
	
}
