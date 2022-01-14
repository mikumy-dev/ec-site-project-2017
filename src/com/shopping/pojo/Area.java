package com.shopping.pojo;

import java.io.Serializable;

/**
 * 
 * @author zz
 * 
 */
public class Area implements Serializable {

	private static final long serialVersionUID = -2615031901703406818L;

	private int id;
	private int areaid;
	private String area;
	private int cityid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAreaid() {
		return areaid;
	}

	public void setAreaid(int areaid) {
		this.areaid = areaid;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public int getCityid() {
		return cityid;
	}

	public void setCityid(int cityid) {
		this.cityid = cityid;
	}

}
