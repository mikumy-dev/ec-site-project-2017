package com.shopping.bean;

import java.math.BigDecimal;

public class ShopCartOnPage {
	
	private Integer pid; 
	private String ppic;
	private String pname;
	private Integer quantity;
	private Integer tasteid;
	private String taste;
	private Double price;
	private Double totalPrice;
	
	public Integer getTasteid() {
		return tasteid;
	}
	public void setTasteid(Integer tasteid) {
		this.tasteid = tasteid;
	}
	public String getTaste() {
		return taste;
	}
	public void setTaste(String taste) {
		this.taste = taste;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPpic() {
		return ppic;
	}
	public void setPpic(String ppic) {
		this.ppic = ppic;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getTotalPrice() {
		if(totalPrice==null){
			double tot = quantity*price;
			BigDecimal b = new BigDecimal(tot);  
			totalPrice = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();  			
		}
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
}
