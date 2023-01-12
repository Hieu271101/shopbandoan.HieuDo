package com.home.shop3.controller.user;

import java.io.IOException;  
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
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
//		model.addAttribute("ahihi",userService.executeNativeSql("SELECT * FROM data.tbl_users;"));
		return "common/user/register";
	}
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(
			final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response, 
//			@ModelAttribute String rpassword,
			@Validated	@ModelAttribute("newAccount") User newAccount,
			BindingResult result
			)throws IOException, Exception{
//		System.out.print(newAccount.getRpassword()+" "+newAccount.getPassword());
//		System.out.print(rpassword);
//		if(!rpassword.equals(newAccount.getPassword())) {
//			result.addError(new FieldError("userDOT", "rpassword", "password  must match"));
//			return "common/user/register";
//		}
		if(result.hasErrors()) {
			
			return "common/user/register";
		}
//		model.addAttribute("newAccount", newAccount);
	

//		System.out.println(newAccount.getUserName() +newAccount.getAddress()+newAccount.getEmail()+newAccount.getName()+newAccount.getPassword()+newAccount.getPhone());
		if(checkExistAccount(newAccount)) {
			model.addAttribute("WarningNotification","Account Existed");
			
			return "common/user/register";
			
		}
		else {
			Date date=new Date();
			date=java.util.Calendar.getInstance().getTime();
			newAccount.setCreatedDate(date);
			newAccount.setPassword(new BCryptPasswordEncoder(4).encode(newAccount.getPassword()));
			//add user vào database
			userService.saveOrUpdate(newAccount);
			
//			System.out.println(newAccount.getId());
			
			User userInDbs=userService.getById(newAccount.getId());
			Role role=roleService.getById(2);
			userInDbs.addRoles(role);
			//add role
			userService.saveOrUpdate(userInDbs);
		}
		
		
		return "common/user/home";
	}
	
	private boolean checkExistAccount(User newUser){
//		List<User>usersInDbs=userService.executeNativeSql("SELECT * FROM data.tbl_users;");
		
		for (User user : userService.findAll()) {
			if(newUser.getUsername().equalsIgnoreCase(user.getUsername())) {
				return true;
			}
		}
		return false;
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
