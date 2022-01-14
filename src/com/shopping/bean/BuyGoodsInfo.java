package com.shopping.bean;

/**
 * 封装 购物时 的一些信息
 * @author zz
 *
 */
public class BuyGoodsInfo {
	private int pid; //商品id
	private int quantity; //商品数量
	private String tast; //商品的口味
	private String pimg; // 商品小图
	private double price; //商品价格
	private String title;
	private double totalMoney; //总金额
	private String postWay ;// 配送方式 包不包邮的问题
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getTast() {
		return tast;
	}
	public void setTast(String tast) {
		this.tast = tast;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotalMoney() {
		return this.getPrice() * this.getQuantity();
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getPostWay() {
		return postWay;
	}
	public void setPostWay(String postWay) {
		this.postWay = postWay;
	}
	
	

}
