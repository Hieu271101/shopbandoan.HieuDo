package com.home.shop3.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.shop3.controller.BaseController;
import com.home.shop3.entities.user.User;
import com.home.shop3.service.user.UserService;

@Controller
public class UserController extends BaseController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("user",new User());
		
		return "common/user/user";
	}
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String profilePost(final Model model, final HttpServletRequest request, final HttpServletResponse response,@ModelAttribute("user")User user) {
		
		userService.saveOrUpdate(user);
	
		return "redirect:home";
	}
}
