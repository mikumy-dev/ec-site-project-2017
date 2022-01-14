package com.shopping.bean;

public class Page {
	private Integer pageNum;
	private Double totalItems;
	private Integer totalPages;
	private Integer itemsOnPage;
	private Integer totalItemsInt;
	private Integer limitFrom;

	public Integer getLimitFrom() {
		if (limitFrom == null) {
			limitFrom = (pageNum - 1) * itemsOnPage;
		}
		return limitFrom;
	}

	public void setLimitFrom(Integer limitFrom) {
		this.limitFrom = limitFrom;
	}

	public Integer getTotalItemsInt() {
		totalItemsInt = totalItems.intValue();
		return totalItemsInt;
	}

	public void setTotalItemsInt(Integer totalItemsInt) {
		this.totalItemsInt = totalItemsInt;
	}

	public Integer getItemsOnPage() {
		if (itemsOnPage == null) {
			itemsOnPage = 5;
		}
		return itemsOnPage;
	}

	public void setItemsOnPage(Integer itemsOnPage) {
		this.itemsOnPage = itemsOnPage;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Double getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(Double totalItems) {
		this.totalItems = totalItems;
	}

	public Integer getTotalPages() {
		if (totalPages == null) {
			totalPages = (int) Math.ceil(totalItems / getItemsOnPage());
		}
		return totalPages;
	}

	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}

	
	public String getPageDatas() {
		return "Page [pageNum=" + getPageNum() + ",\n totalItems=" + totalItems + ",\n totalPages=" + getTotalPages()
				+ ",\n itemsOnPage=" + getItemsOnPage() + ",\n totalItemsInt=" + getTotalItemsInt() + ",\n limitFrom="
				+ getLimitFrom() + "]";
	}

}
