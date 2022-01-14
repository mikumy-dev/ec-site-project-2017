package com.shopping.bean;

public class ProductPojo {
	private Integer productid;
	private String productName;
	private double price;
	private int num;
	private int tasteid;
	private String tasteName;
	private String pic;
	
	public int getTasteid() {
		return tasteid;
	}
	public void setTasteid(int tasteid) {
		this.tasteid = tasteid;
	}
	public Integer getProductid() {
		return productid;
	}
	public void setProductid(Integer productid) {
		this.productid = productid;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTasteName() {
		return tasteName;
	}
	public void setTasteName(String tasteName) {
		this.tasteName = tasteName;
	}
	
}
