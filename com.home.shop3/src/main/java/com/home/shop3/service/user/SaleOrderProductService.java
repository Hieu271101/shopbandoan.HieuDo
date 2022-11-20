package com.home.shop3.service.user;

import org.springframework.stereotype.Service;

import com.home.shop3.dto.user.SaleOrderProduct;
import com.home.shop3.service.BaseService;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProduct> {

	@Override
	protected Class<SaleOrderProduct> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProduct.class;
	}

}
