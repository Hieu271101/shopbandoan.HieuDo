package com.home.shop3.dto.user;

import java.math.BigDecimal;

public class CartItems {
	private int productId;
	private String productName;
	private int quanlity;
	private BigDecimal priceUnit;
	private int count=0;
	private BigDecimal toltalPriceItem;
	
	private String avatar;
	
	
	public BigDecimal getToltalPriceItem() {
		return toltalPriceItem;
	}

	public void setToltalPriceItem(BigDecimal toltalPriceItem) {
		this.toltalPriceItem = toltalPriceItem;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}

	public BigDecimal getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

}
