package com.home.shop3.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.shop3.controller.BaseController;

@Controller
public class LoginController extends BaseController {
	
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public String login(final Model model, final HttpServletRequest request, final HttpServletResponse respose) throws IOException{
		if(isLogined()==true) {
			return "common/user/home";
		}
		return "common/user/login"; 
	}
}
