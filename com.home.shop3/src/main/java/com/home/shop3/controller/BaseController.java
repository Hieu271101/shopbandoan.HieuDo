package com.home.shop3.controller;

import javax.servlet.http.HttpServletRequest; 

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.home.shop3.entities.user.Role;
import com.home.shop3.entities.user.User;

public class BaseController {
	
	public Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		}
		catch (Exception e) {
			// TODO: handle exception
			return null;
			
		}
	}
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
	@ModelAttribute("isAdmin")
	public boolean isAdmin() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails) {
			User user = (User) userLogined;
			for(Role role : user.getRoles()) {
				if(role.getAuthority().equals("ADMIN")) {
					return true;
				}
			}
		}
		return false;
	}
	
	@ModelAttribute("isAdmin1")
	public boolean isAdmin1() {
		Object userLogined =SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined!=null &&userLogined instanceof UserDetails) {
			User user=(User)userLogined;
			for(Role role:user.getRoles()) {
				if(role.getAuthority().equals("ADMIN1")) {
					return true;
				}
			}
		}
		return false;
		
	}
	
	
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}
		
		return isLogined;
	}
	
	/**
	 * trả về entity User chính là user logined
	 * User logined có thể truy cập thông qua class SecurityContextHolder
	 * @return
	 */
	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (User) userLogined;
	
		return new User();
	}

	
}
