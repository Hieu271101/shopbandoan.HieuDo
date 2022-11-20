package com.home.shop3.controller.manager;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.shop3.controller.BaseController;
import com.home.shop3.entities.admin.EmployeeEntity;

import com.home.shop3.service.admin.EmployeeService;

@Controller
public class ManageIntestine extends BaseController  {

	@Autowired
	EmployeeService employeeService=new EmployeeService();
	
	@RequestMapping(value="/admin/intestine",method=RequestMethod.GET)
	public String intestine(final Model model,final HttpServletRequest response,final HttpServletRequest request ) {
		
		List<EmployeeEntity> list=employeeService.findNoActive();
		model.addAttribute("list",list);
		return "common/manager/manageIntestine";
	}
	
}
