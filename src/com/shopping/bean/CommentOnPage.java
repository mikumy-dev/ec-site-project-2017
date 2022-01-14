package com.shopping.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentOnPage {

	private Integer id;
	private String status;
	private String content;
	private Date createdDay;
	private String createdDayStr;	
	
	private Integer productid;
	private String productname;
	private String productpic;
	private Integer tasteid;
	private String tastename;
	
	private Integer userid;
	private String username;
	private String avatar;
	
	public String getCreatedDayStr() {
		if(createdDayStr==null){
			SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
			createdDayStr = format.format(createdDay);
		}
		return createdDayStr;
	}
	public void setCreatedDayStr(String createdDayStr) {
		this.createdDayStr = createdDayStr;
	}
	public Integer getTasteid() {
		return tasteid;
	}
	public void setTasteid(Integer tasteid) {
		this.tasteid = tasteid;
	}
	public String getTastename() {
		return tastename;
	}
	public void setTastename(String tastename) {
		this.tastename = tastename;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreatedDay() {
		return createdDay;
	}
	public void setCreatedDay(Date createdDay) {
		this.createdDay = createdDay;
	}
	public Integer getProductid() {
		return productid;
	}
	public void setProductid(Integer productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getProductpic() {
		return productpic;
	}
	public void setProductpic(String productpic) {
		this.productpic = productpic;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	
}
