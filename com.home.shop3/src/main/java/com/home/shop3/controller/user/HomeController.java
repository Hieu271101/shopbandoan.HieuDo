package com.home.shop3.controller.user;

import java.io.IOException;  
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.shop3.controller.BaseController;
//import com.home.shop3.dto.user.Cart;
import com.home.shop3.dto.user.CartItems;
import com.home.shop3.entities.admin.ProductsEntity;
//import com.home.shop3.entities.user.UserEntity;





@Controller
public class HomeController extends BaseController {
	
	

	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String defaultApp(final Model model, final HttpServletRequest request, final HttpServletResponse respose) throws IOException{
//		Cart gioHang=taoGioHang();
//		HttpSession session= request.getSession();
//		session.setAttribute("giohang", gioHang);
		
		
		return "common/user/home";
	}
	
	@RequestMapping(value = "/home", method=RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse respose) throws IOException{
//		Cart gioHang=taoGioHang();
//		HttpSession session= request.getSession();
//		session.setAttribute("giohang", gioHang);


		return "common/user/home";
	}
	@RequestMapping(value="/home", method=RequestMethod.POST)
	public String contact(final Model model, final HttpServletRequest request,final HttpServletResponse response,@ModelAttribute("newAccount") ProductsEntity newProduct ) throws IOException {
		
		
		return "common/index";
	}
	
}
