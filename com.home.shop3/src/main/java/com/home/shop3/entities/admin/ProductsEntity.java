package com.home.shop3.entities.admin;

import java.math.BigDecimal; 
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.home.shop3.dto.user.SaleOrderProduct;
import com.home.shop3.entities.BaseEntity;
//import com.home.shop3.entities.user.UserEntity;
import com.home.shop3.entities.user.UserOrder;

@Entity
@Table(name = "tbl_product")
public class ProductsEntity extends BaseEntity {

	@Column(name = "name", nullable = false)
	private String name;
	@Column(name = "img", nullable = true)
	private String img;
	@Column(name = "amount", nullable = false)
	private int amount;

	@Column(name = "price", nullable = false)
	private BigDecimal price;

	@Column(name = "supplier", nullable = true)
	private String supplier;

	@Column(name = "cost_price", nullable = false)
	private BigDecimal costPrice;

	@Column(name = "description", length = 999, nullable = true)
	private String description;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "products")
//	@OneToMany(cascade = CascadeType.ALL, mappedBy = "saleOrder", fetch = FetchType.EAGER)
	private Set<SaleOrderProduct> products = new HashSet<SaleOrderProduct>();

	public void addProducts(SaleOrderProduct _saleOrderProducts) {
		_saleOrderProducts.setProducts(this);
		products.add(_saleOrderProducts);
	}

	public void removeProducts(SaleOrderProduct _saleOrderProducts) {
		_saleOrderProducts.setProducts(null);
		products.remove(_saleOrderProducts);
	}

//	@Column(name="category_id",nullable=false)
//	private int category_id;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "product")
	private Set<ProductImages> imgs = new HashSet<ProductImages>();

	public void addProductImages(ProductImages _productImages) {
		_productImages.setProduct(this);
		imgs.add(_productImages);
	}

	public void deleteProductImages(ProductImages _productImages) {
		_productImages.setProduct(null);
		imgs.remove(_productImages);
	}

	@Column(name = "avatar")
	private String avatar;

	public Set<ProductImages> getImgs() {
		return imgs;
	}

	public void setImgs(Set<ProductImages> imgs) {
		this.imgs = imgs;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private CategoryEntity category;

//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name="id_product")
//	private OrderEntity orders;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "products")
	private Set<UserOrder> userOrder = new HashSet<UserOrder>();

	public Set<UserOrder> getUserOrder() {
		return userOrder;
	}

	public void setUserOrder(Set<UserOrder> userOrder) {
		this.userOrder = userOrder;
	}

	public CategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CategoryEntity category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public BigDecimal getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(BigDecimal costPrice) {
		this.costPrice = costPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
