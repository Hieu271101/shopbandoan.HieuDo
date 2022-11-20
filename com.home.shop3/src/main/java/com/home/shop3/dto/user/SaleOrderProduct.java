package com.home.shop3.dto.user;

import javax.persistence.Column; 
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.home.shop3.entities.BaseEntity;
import com.home.shop3.entities.admin.ProductsEntity;

@Entity
@Table(name = "tbl_saleorder_product")
public class SaleOrderProduct extends BaseEntity {
	@Column(name = "quality")
	private Integer quanlity;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private ProductsEntity products;
	
	@ManyToOne(fetch =  FetchType.EAGER)
	@JoinColumn(name="saleorder_id")
	private SaleOrder saleOrders;
	
	
	
	
	public ProductsEntity getProducts() {
		return products;
	}

	public void setProducts(ProductsEntity products) {
		this.products = products;
	}

	public SaleOrder getSaleOrders() {
		return saleOrders;
	}

	public void setSaleOrders(SaleOrder saleOrders) {
		this.saleOrders = saleOrders;
	}

	public Integer getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(Integer quality) {
		this.quanlity = quality;
	}
	
	
	
}
