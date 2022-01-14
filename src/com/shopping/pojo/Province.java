package com.shopping.pojo;

import java.io.Serializable;

/**
 * 
 * @author zz
 *
 */
public class Province implements Serializable{

	private static final long serialVersionUID = 2359243796334339277L;
	
	private int id;
	private int provinceid; //省id
	private String province; //省名
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProvinceid() {
		return provinceid;
	}
	public void setProvinceid(int provinceid) {
		this.provinceid = provinceid;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	
}
