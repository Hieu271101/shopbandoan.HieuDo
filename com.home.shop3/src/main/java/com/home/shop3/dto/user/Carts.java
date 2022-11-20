package com.home.shop3.dto.user;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Carts {
	private BigDecimal totalPrice = BigDecimal.ZERO;
	private List<CartItems> cartItems = new ArrayList<CartItems>();

	public List<CartItems> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItems> cartItems) {
		this.cartItems = cartItems;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

}
