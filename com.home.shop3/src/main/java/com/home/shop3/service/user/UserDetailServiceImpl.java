package com.home.shop3.service.user;


import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

//import com.home.shop3.entities.user.UserEntity;
//import com.home.shop3.service.BaseService;
@Service
public  class UserDetailServiceImpl implements UserDetailsService {
	@Autowired
	private UserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// connect tới db và lấy user theo username
		
		
		return userService.loadUserByUsername(username);
	}
}
