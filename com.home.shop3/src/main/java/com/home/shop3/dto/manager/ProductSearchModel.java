package com.home.shop3.dto.manager;

import com.home.shop3.dto.BaseSearchModel; 
//import com.home.shop3.entities.admin.BaseEntity;

public class ProductSearchModel  extends BaseSearchModel{
	private String keyword;
	private Integer categoryId;
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	
	
}
