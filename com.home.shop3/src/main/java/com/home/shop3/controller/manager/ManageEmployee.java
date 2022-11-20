package com.home.shop3.controller.manager;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;


import com.home.shop3.controller.BaseController;
import com.home.shop3.entities.admin.CategoryEntity;
import com.home.shop3.entities.admin.EmployeeEntity;
import com.home.shop3.entities.admin.PositionEmployee;
import com.home.shop3.entities.admin.ProductsEntity;
import com.home.shop3.entities.user.User;
import com.home.shop3.service.admin.EmployeeService;
import com.home.shop3.service.admin.PositionService;

@Controller
public class ManageEmployee extends BaseController  {
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private  PositionService positionService;
	
	@RequestMapping(value="/admin/employee",method=RequestMethod.GET)
	public String displayEmployee(final Model model,final HttpServletRequest request, final HttpServletResponse response) {
		List<EmployeeEntity> employees=employeeService.findAllActive();
		model.addAttribute("employees",employees);
		return "common/manager/manageEmployee";
	}
	


	
	@RequestMapping(value="/admin/employee/management", method=RequestMethod.GET)
	public String addEmployeee(final Model model,final HttpServletRequest request, final HttpServletResponse response) {
		
		List<PositionEmployee> positionEmployee=positionService.findAll();
		
		
		
		model.addAttribute("positionItems",positionEmployee);
		model.addAttribute("newEmployee",new EmployeeEntity());
		
//		User user=new User();
//		model.addAttribute("newAccount",user);
		
		return "common/manager/addEmployee";
	}
	
	
//	@RequestMapping(value="admin/manageEmployee/add-employe/",method=RequestMethod.POST)
//	public String addAcount(final Model model, 
//			   final HttpServletRequest request,
//			   final HttpServletResponse response,
//			   @ModelAttribute("newAccount")User newAccount) {
//		
//		return "common/manager/addEmployee";
//	}
	
	@RequestMapping(value = { "/admin/employee/management/{employeeId}" }, method = RequestMethod.GET)
	public String adminEmployeeDetail(final Model model, 
								   final HttpServletRequest request,
								   final HttpServletResponse response, 
								   @PathVariable("employeeId") int employeeId
								   ) throws IOException {
		List<PositionEmployee> positionEmployee=positionService.findAll();
		
		
		
		model.addAttribute("positionItems",positionEmployee);
		// lấy product trong db theo ID
		EmployeeEntity employeeInDatabase = employeeService.getById(employeeId);
		
		model.addAttribute("newEmployee", employeeInDatabase);
		
		return "common/manager/addEmployee";
		
	}
	@RequestMapping(value="/admin/employee/management", method=RequestMethod.POST)
	public String adminEmployeeAddOrUpdate(final Model model,
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@ModelAttribute("newEmployee") EmployeeEntity employee
			
			,@RequestParam("imgEmployee") MultipartFile imgEmployee
			) throws Exception, MultipartException {
		
//		Date date=new Date();
//		date=java.util.Calendar.getInstance().getTime();
//		employee.setCreatedDate(date);
		
		if (employee.getId() == null || employee.getId() <= 0) {
			employeeService.add(employee, imgEmployee);
		}
		// chỉnh sửa
		else
		{ 
			employeeService.update(employee, imgEmployee);
		}
//		employeeService.add(employee,imgEmployee);
		
//		List<PositionEmployee> positionEmployee=positionService.findAll();
//		model.addAttribute("positionItems",positionEmployee);
//		return "common/manager/addEmployee";
		return "redirect:/admin/employee";
	}
//	@RequestMapping(value="admin/manageEmployee/add-employe",method=RequestMethod.POST)
//	public String adminProductAddOrUpdate(final Model model, 
//										  final HttpServletRequest request,
//										  final HttpServletResponse response, 
//										  @ModelAttribute("newProduct") EmployeeEntity employee
//										  ,@RequestParam("position") PositionEmployee employeePosition
//										  ,@RequestParam("employeeAvatar") MultipartFile employeeAvatar
////										
//	) throws Exception {
//
//		// thêm mới
//		if (employee.getId() == null || employee.getId() <= 0) {
//			employee.setPosition(employeePosition);
//			employeeService.add(employee, employeeAvatar);
//		}
//		// chỉnh sửa
//		else
//		{ 
//			employeeService.update(employee, employeeAvatar);
//		}
//		
////		productsService.saveOrUpdate(product);
//		
//		// trở về trang danh sách
////		return "redirect:/admin/product/list";
////		return "common/manager/addProduct";
//		return "redirect:";
////		return "admin/product";
//	}
	
	@RequestMapping(value = { "admin/manageEmployee/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteEmp(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody EmployeeEntity employee) {
//		System.out.println(product.getName());
		
		EmployeeEntity employeeInDbs=employeeService.getById(employee.getId());
		employeeInDbs.setStatus(false);
		employeeService.saveOrUpdate(employeeInDbs);
		
//		System.out.println(contact.getMail());
		
		Map<String, Object> jsonResult = new HashMap<String, Object> ();
		jsonResult.put("statusCode", 200); // status code ví dụ: 200: Success, 500: Error, 404: NotFound
		jsonResult.put("statusMessage", "Cảm ơn bạn "  + ", Chúng tôi sẽ liên hệ sớm nhất!");
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/admin/manageEmployee/add-position" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_addPosition(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody PositionEmployee position) {	
		positionService.saveOrUpdate(position);
		
		Map<String, Object> jsonResult = new HashMap<String, Object> ();
		jsonResult.put("statusCode", 200); // status code ví dụ: 200: Success, 500: Error, 404: NotFound
		jsonResult.put("statusMessage", "Cảm ơn bạn ");
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/admin/employee/management/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteEmployee(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody EmployeeEntity employee) {	
//		System.out.println(employee.getDescriptionCondition());
		System.out.println(employee.getId());
		EmployeeEntity employeeInDbs=employeeService.getById(employee.getId());
		employeeInDbs.setStatus(false);
		employeeService.saveOrUpdate(employeeInDbs);
//		System.out.println(employeeInDbs.getName());
//		employeeInDbs.setStatus(false);
//		employeeInDbs.setDescriptionCondition(employee.getDescriptionCondition());
		
		Map<String, Object> jsonResult = new HashMap<String, Object> ();
		jsonResult.put("statusCode", 200); // status code ví dụ: 200: Success, 500: Error, 404: NotFound
		jsonResult.put("statusMessage", "Cảm ơn bạn ");
		return ResponseEntity.ok(jsonResult);
	}
	
}
