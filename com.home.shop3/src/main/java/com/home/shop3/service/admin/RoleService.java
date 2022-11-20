package com.home.shop3.service.admin;

import org.springframework.stereotype.Service;

import com.home.shop3.entities.user.Role;
import com.home.shop3.service.BaseService;

@Service
public class RoleService extends BaseService<Role> {

	@Override
	protected Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}
	
	
}
