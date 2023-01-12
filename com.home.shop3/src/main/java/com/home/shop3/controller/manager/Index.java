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
		model.addAttribute("dataset","{\r\n"
				+ "					label : \"Dữ liệu kế tiếp\",\r\n"
				+ "					backgroundColor : \"rgba(9, 109, 239, 0.651)  \",\r\n"
				+ "					pointColor : \"rgb(9, 109, 239)\",\r\n"
				+ "					strokeColor : \"rgb(9, 109, 239)\",\r\n"
				+ "					pointStrokeColor : \"rgb(9, 109, 239)\",\r\n"
				+ "					pointHighlightFill : \"rgb(9, 109, 239)\",\r\n"
				+ "					pointHighlightStroke : \"rgb(9, 109, 239)\",\r\n"
				+ "					data : [ 48, 48, 49, 39, 86, 10 ]\r\n"
				+ "				},\r\n"
				+ "				{\r\n"
				+ "					label : \"Dữ liệu đầu tiên\",\r\n"
				+ "					backgroundColor : \"rgba(255, 213, 59, 0.767), 212, 59)\",\r\n"
				+ "					strokeColor : \"rgb(255, 212, 59)\",\r\n"
				+ "					pointColor : \"rgb(255, 212, 59)\",\r\n"
				+ "					pointStrokeColor : \"rgb(255, 212, 59)\",\r\n"
				+ "					pointHighlightFill : \"rgb(255, 212, 59)\",\r\n"
				+ "					pointHighlightStroke : \"rgb(255, 212, 59)\",\r\n"
				+ "					data : [ 20, 59, 90, 51, 56, 100 ]\r\n"
				+ "					} ");
		return "common/manager/index";
	}
	
}
