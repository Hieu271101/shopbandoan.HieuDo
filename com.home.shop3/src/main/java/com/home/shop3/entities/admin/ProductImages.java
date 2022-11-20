package com.home.shop3.entities.admin;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.home.shop3.entities.BaseEntity;




@Entity
@Table(name = "tbl_products_images")
public class ProductImages extends BaseEntity {
	
	@Column(name = "title")
	private String title;
	
	@Column(name="path")
	private String path;
	
	@ManyToOne(fetch  = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private ProductsEntity product;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public ProductsEntity getProduct() {
		return product;
	}

	public void setProduct(ProductsEntity product) {
		this.product = product;
	}
	
	
	
}
