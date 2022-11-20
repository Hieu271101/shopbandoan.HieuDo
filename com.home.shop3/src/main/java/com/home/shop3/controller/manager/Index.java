package com.home.shop3.controller.manager;

import java.io.IOException;  
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.shop3.controller.BaseController;
//import com.home.shop3.entities.admin.OrderEntity;
import com.home.shop3.entities.admin.ProductsEntity;
import com.home.shop3.entities.user.User;
//import com.home.shop3.service.admin.OrderService;
import com.home.shop3.service.admin.ProductsService;
import com.home.shop3.service.user.UserService;
//import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

@Controller
public class Index extends BaseController  {
//	@Autowired
//	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	@Autowired 
	private ProductsService productsService;
	@RequestMapping(value="/admin", method =RequestMethod.GET)
	public String index(final Model model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
		List<ProductsEntity> ProductOver=productsService.findNearOver();
		int countProductOver=ProductOver.size();
		model.addAttribute("countProductOver",countProductOver);
		
		List<ProductsEntity> allActiveProduct=productsService.findAllActive();
		int countProduct=allActiveProduct.size();
		model.addAttribute("countProduct",countProduct);
		List<User> allUserActive=userService.findActiveUser();
		int countUser=allUserActive.size();
		model.addAttribute("countUser",countUser);
//		List<OrderEntity> allOrderActive=orderService.findAllActive();
//		int countOrder= allOrderActive.size();
//		model.addAttribute("countOrder",countOrder);
//		List<OrderEntity> newOrder=orderService.findNearOrder();
		List<User> nearUsers=userService.findNearUser();
		model.addAttribute("nearUsers",nearUsers);
//		model.addAttribute("newOrder",newOrder);
		return "common/manager/index";
	}
	
}
