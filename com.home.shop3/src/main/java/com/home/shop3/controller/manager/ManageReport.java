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
import com.home.shop3.entities.admin.EmployeeEntity;
//import com.home.shop3.entities.admin.OrderEntity;
import com.home.shop3.entities.admin.ProductsEntity;
import com.home.shop3.entities.user.User;
import com.home.shop3.service.admin.EmployeeService;
//import com.home.shop3.service.admin.OrderService;
import com.home.shop3.service.admin.ProductsService;
import com.home.shop3.service.user.UserService;


@Controller
public class ManageReport extends BaseController  {
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired 
	private ProductsService productsService;
	
//	@Autowired
//	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	@RequestMapping(value = "admin/report",method =RequestMethod.GET)
	public String manageReport(final Model model,final HttpServletResponse response,final HttpServletRequest request) throws IOException {
		List<EmployeeEntity> activeEmployees=employeeService.findAllActive();
		model.addAttribute("activeEmployees", activeEmployees);
		
		List<ProductsEntity> allActiveProduct=productsService.findAllActive();
		model.addAttribute("allActiveProduct",allActiveProduct);
		
		List<EmployeeEntity> noActiveEmployees=employeeService.findNoActive();
		model.addAttribute("noActiveEmployees",noActiveEmployees);
		
//		List<OrderEntity> listOrders=orderService.findAllActive();
//		model.addAttribute("listOrders",listOrders);
		
		List<User> listNearUsers=userService.findNearUser();
		model.addAttribute("listNearUsers",listNearUsers);
		
		List<ProductsEntity> overProducts=productsService.findOver();
		model.addAttribute("overProducts",overProducts);
		
//		List<OrderEntity> cancelOrders=orderService.findCancelOrder();
//		model.addAttribute("cancelOrders",cancelOrders);
		
		List<EmployeeEntity> listEmployeeNearRegister=employeeService.findNearRegister();
		model.addAttribute("nearEmployees",listEmployeeNearRegister);
		
		List<ProductsEntity> listHotProduct=productsService.findHotProduct();
		model.addAttribute("listHotProduct",listHotProduct);
		model.addAttribute("datasetBefore","20, 59, 90, 51, 56, 100, 40, 60, 78, 53, 33, 81");
		model.addAttribute("datasetAfter","48, 48, 49, 39, 86, 10, 50, 70, 60, 70, 75, 90");
		return "common/manager/manageReport";
	}
	
}
