package com.home.shop3.controller.user;

import java.io.IOException; 
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.shop3.controller.BaseController;
import com.home.shop3.entities.user.Role;
import com.home.shop3.entities.user.User;
import com.home.shop3.service.admin.RoleService;
import com.home.shop3.service.user.UserService;

@Controller
public class RegisterController extends BaseController {
	@Autowired
	protected UserService userService;
	@Autowired
	protected RoleService roleService;
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(final Model model, final HttpServletRequest request, final HttpServletResponse response)throws IOException{
		
		model.addAttribute("newAccount", new User());
		
		return "common/user/register";
	}
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(final Model model, final HttpServletRequest request, final HttpServletResponse response, @ModelAttribute("newAccount") User newAccount)throws IOException{
//		model.addAttribute("newAccount", newAccount);
		
//		System.out.println(newAccount.getUserName() +newAccount.getAddress()+newAccount.getEmail()+newAccount.getName()+newAccount.getPassword()+newAccount.getPhone());
		Date date=new Date();
		date=java.util.Calendar.getInstance().getTime();
		newAccount.setCreatedDate(date);
		newAccount.setPassword(new BCryptPasswordEncoder(4).encode(newAccount.getPassword()));
		
		userService.saveOrUpdate(newAccount);
		
//		System.out.println(newAccount.getId());
		
		User userInDbs=userService.getById(newAccount.getId());
		Role role=roleService.getById(2);
		userInDbs.addRoles(role);
		userService.saveOrUpdate(userInDbs);
		
		return "common/user/home";
	}
	
	
//	@RequestMapping(value = "/admin/register", method = RequestMethod.GET)
//	public String adminRegister(final Model model, final HttpServletRequest request, final HttpServletResponse response)throws IOException{
//		
//		model.addAttribute("newAccount", new User());
//		
//		return "common/manager/AdminRegister";
//	}
//	@RequestMapping(value = "/admin/register", method = RequestMethod.POST)
//	public String adminRegister(final Model model, final HttpServletRequest request, final HttpServletResponse response, @ModelAttribute("newAccount") User newAccount)throws IOException{
////		model.addAttribute("newAccount", newAccount);
//		
////		System.out.println(newAccount.getUserName() +newAccount.getAddress()+newAccount.getEmail()+newAccount.getName()+newAccount.getPassword()+newAccount.getPhone());
//		Date date=new Date();
//		date=java.util.Calendar.getInstance().getTime();
//		newAccount.setCreatedDate(date);
//		newAccount.setPassword(new BCryptPasswordEncoder(4).encode(newAccount.getPassword()));
//		
//		userService.saveOrUpdate(newAccount);
//		return "common/user/home";
//	}
	
	
}
