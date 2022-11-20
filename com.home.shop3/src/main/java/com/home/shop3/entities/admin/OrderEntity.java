package com.home.shop3.entities.admin;

import java.math.BigDecimal;  

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;

import com.home.shop3.entities.BaseEntity;
import com.home.shop3.entities.user.User;



@Entity
@Table(name= "tbl_orders")
public class OrderEntity extends BaseEntity {

	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="id_product")
	private ProductsEntity product;
	
	
	public ProductsEntity getProduct() {
		return product;
	}

	public void setProduct(ProductsEntity product) {
		this.product = product;
	}
	
	@Column(name="status_transport")
	private String statusTransport;
	
	

	public String getStatusTransport() {
		return statusTransport;
	}

	public void setStatusTransport(String statusTransport) {
		this.statusTransport = statusTransport;
	}

	@Column(name="amount", nullable = false)
	private int amount;
	
	@Column(name="money",nullable=false)
	private BigDecimal money;
	


	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_customer")
	private User customer;
	
	@Column(name="status_order")
	private String statusOfOrder;
	
	
	
	public String getStatusOfOrder() {
		return statusOfOrder;
	}

	public void setStatusOfOrder(String statusOfOrder) {
		this.statusOfOrder = statusOfOrder;
	}

	public User getCustomer() {
		return customer;
	}

	public void setCustomer(User customer) {
		this.customer = customer;
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


	
	
	
	
}
