package com.shopping.pojo;

import java.util.Date;

public class Product {
	private Integer id;
    private String productName;
    private String productPictureBig;
    private String productPictureMid;
    private String productPictureSmall;
    private String productDetailsPicture;
    private String productType;
    private String materialAddr;
    private String produceAddr;
    private String ingredients;
    private Integer specifications;
    private String expirationTime;
    private String standardNo;
    private String productionLicense;
    private String storage;
    private String edibleMethods;
    private Integer inventory;
    private Double price;
    private String tasteid;
    private Integer status;
    
    //销量
    private Integer salesVolume;
    //好评率
    private Double goodCommentRatio;
    
    private String createdBy;
    private Date createdDate;
    private String lastUpdateBy;
    private Date lastUpdateDate;
    private String productDetails;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    public String getProductPictureBig() {
        return productPictureBig;
    }

    public void setProductPictureBig(String productPictureBig) {
        this.productPictureBig = productPictureBig == null ? null : productPictureBig.trim();
    }


	public String getProductPictureMid() {
        return productPictureMid;
    }

    public void setProductPictureMid(String productPictureMid) {
        this.productPictureMid = productPictureMid == null ? null : productPictureMid.trim();
    }

    public String getProductPictureSmall() {
        return productPictureSmall;
    }

    public void setProductPictureSmall(String productPictureSmall) {
        this.productPictureSmall = productPictureSmall == null ? null : productPictureSmall.trim();
    }

    public String getProductDetailsPicture() {
        return productDetailsPicture;
    }

    public void setProductDetailsPicture(String productDetailsPicture) {
        this.productDetailsPicture = productDetailsPicture == null ? null : productDetailsPicture.trim();
    }

    public Integer getSalesVolume() {
        return salesVolume;
    }

    public void setSalesVolume(Integer salesVolume) {
        this.salesVolume = salesVolume;
    }


    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType == null ? null : productType.trim();
    }

    public String getMaterialAddr() {
        return materialAddr;
    }

    public void setMaterialAddr(String materialAddr) {
        this.materialAddr = materialAddr == null ? null : materialAddr.trim();
    }

    public String getProduceAddr() {
        return produceAddr;
    }

    public void setProduceAddr(String produceAddr) {
        this.produceAddr = produceAddr == null ? null : produceAddr.trim();
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients == null ? null : ingredients.trim();
    }

    public Integer getSpecifications() {
        return specifications;
    }

    public void setSpecifications(Integer specifications) {
        this.specifications = specifications;
    }

    public String getExpirationTime() {
        return expirationTime;
    }

    public void setExpirationTime(String expirationTime) {
        this.expirationTime = expirationTime == null ? null : expirationTime.trim();
    }

    public String getStandardNo() {
        return standardNo;
    }

    public void setStandardNo(String standardNo) {
        this.standardNo = standardNo == null ? null : standardNo.trim();
    }

    public String getProductionLicense() {
        return productionLicense;
    }

    public void setProductionLicense(String productionLicense) {
        this.productionLicense = productionLicense == null ? null : productionLicense.trim();
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage == null ? null : storage.trim();
    }

    public String getEdibleMethods() {
        return edibleMethods;
    }

    public void setEdibleMethods(String edibleMethods) {
        this.edibleMethods = edibleMethods == null ? null : edibleMethods.trim();
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getTasteid() {
        return tasteid;
    }

    public void setTasteid(String tasteid) {
        this.tasteid = tasteid == null ? null : tasteid.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy == null ? null : createdBy.trim();
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getLastUpdateBy() {
        return lastUpdateBy;
    }

    public void setLastUpdateBy(String lastUpdateBy) {
        this.lastUpdateBy = lastUpdateBy == null ? null : lastUpdateBy.trim();
    }

    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public String getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(String productDetails) {
        this.productDetails = productDetails == null ? null : productDetails.trim();
    }

	public Double getGoodCommentRatio() {
		return goodCommentRatio;
	}

	public void setGoodCommentRatio(Double goodCommentRatio) {
		this.goodCommentRatio = goodCommentRatio;
	}
}