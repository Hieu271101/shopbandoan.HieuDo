package com.home.shop3.service.user;

import org.springframework.stereotype.Service;

import com.home.shop3.entities.user.ContactEntity;
import com.home.shop3.service.BaseService;

@Service
public class ContactService  extends BaseService<ContactEntity>{

	@Override
	protected Class<ContactEntity> clazz() {
		// TODO Auto-generated method stub
		return ContactEntity.class;
	}
	
}
