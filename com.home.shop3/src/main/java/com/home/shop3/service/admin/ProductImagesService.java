package com.home.shop3.service.admin;

import org.springframework.stereotype.Service;

import com.home.shop3.entities.admin.ProductImages;
import com.home.shop3.service.BaseService;



@Service
public class ProductImagesService  extends BaseService<ProductImages>{

	@Override
	protected Class<ProductImages> clazz() {
		// TODO Auto-generated method stub
		return ProductImages.class;
	}
	
}
