package com.home.shop3.entities.admin;

import java.util.HashSet; 
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.home.shop3.entities.BaseEntity;

@Entity
@Table(name = "tbl_category_product")
public class CategoryEntity extends BaseEntity {
	
	
	@Column(name = "name", nullable = false)
	private String name;
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy = "category")
	private Set<ProductsEntity> products=new HashSet<ProductsEntity>();
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<ProductsEntity> getProducts() {
		return products;
	}

	public void setProducts(Set<ProductsEntity> products) {
		this.products = products;
	}
	
	
	
	
	
	
}
