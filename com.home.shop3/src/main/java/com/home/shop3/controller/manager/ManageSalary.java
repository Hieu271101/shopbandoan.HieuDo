package com.home.shop3.controller.manager;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.shop3.controller.BaseController;
import com.home.shop3.entities.admin.EmployeeEntity;
import com.home.shop3.service.admin.EmployeeService;

@Controller
public class ManageSalary extends BaseController  {
	@Autowired EmployeeService employeeService;
	
	@RequestMapping(value="admin/salary", method =RequestMethod.GET)
	public String salary(final Model model, final HttpServletRequest request, final HttpServletResponse response)throws IOException{
		List<EmployeeEntity> employees=employeeService.findAll();
//		for(int i=0;i<employees.size();i++) {
//			double totalPrice=employees.get(i).getSalary().doubleValue() +(double)employees.get(i).getSalaryPlus()-(double)employees.get(i).getSalaryMinor();
//			employees.get(i).setS
//		}
		model.addAttribute("employees",employees);
		
		return "common/manager/manageSalary";
	}
//	@RequestMapping(value="manager/salary", method=RequestMethod.POST)
//	public String salary(final Model model, final HttpServletRequest request, final HttpServletResponse response, @ModelAttribute("salary")EmployeeEntity salary) {
//		
//		
//		
//		return "common/manager/manageSalary";
//	}
//	
	
}
