package com.shopping.bean;

public class SearchCondition {
	
	private Integer productType;
	
	private String orderByCondition;
	
	private String keyword;

	public Integer getProductType() {
		return productType;
	}

	public void setProductType(Integer productType) {
		this.productType = productType;
	}

	public String getOrderByCondition() {
		return orderByCondition;
	}

	public void setOrderByCondition(String orderByCondition) {
		this.orderByCondition = orderByCondition;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchCondition [productType=" + productType
				+ ", orderByCondition=" + orderByCondition + ", keyword="
				+ keyword + "]";
	}
	
	
}
