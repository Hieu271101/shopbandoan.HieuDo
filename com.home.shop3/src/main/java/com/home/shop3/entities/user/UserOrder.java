package com.home.shop3.entities.user;

import java.math.BigDecimal; 

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.home.shop3.entities.BaseEntity;
//import com.home.shop3.entities.admin.BaseEntity;
import com.home.shop3.entities.admin.ProductsEntity;

@Entity
@Table(name = "tbl_user_order")
public class UserOrder extends BaseEntity {
	@Column(name = "amount")
	private int amount;
	
	@Column(name="money")
	private BigDecimal money;
	
	@Column(name="status_order")
	private String statusOrder;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_product")
	private ProductsEntity products;
	
	
	
	public ProductsEntity getProducts() {
		return products;
	}

	public void setProducts(ProductsEntity products) {
		this.products = products;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public String getStatusOrder() {
		return statusOrder;
	}

	public void setStatusOrder(String statusOrder) {
		this.statusOrder = statusOrder;
	}
	
	
}
