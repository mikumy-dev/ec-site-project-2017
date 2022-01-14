package com.shopping.pojo;

import java.io.Serializable;

/**
 * 
 * @author zz
 *
 */
public class City implements Serializable{

	private static final long serialVersionUID = 5732340309975823476L;
	private int id;
	private int cityid;
	private String city; //城市名
	private int provinceid; //省id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCityid() {
		return cityid;
	}
	public void setCityid(int cityid) {
		this.cityid = cityid;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getProvinceid() {
		return provinceid;
	}
	public void setProvinceid(int provinceid) {
		this.provinceid = provinceid;
	}
	
	
}
