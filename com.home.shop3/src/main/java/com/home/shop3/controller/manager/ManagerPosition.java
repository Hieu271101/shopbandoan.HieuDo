package com.home.shop3.controller.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.shop3.controller.BaseController;
import com.home.shop3.entities.admin.EmployeeEntity;
import com.home.shop3.entities.admin.PositionEmployee;
import com.home.shop3.service.admin.PositionService;

public class ManagerPosition extends BaseController  {
	
	@Autowired
	private PositionService positionService=new PositionService();
	
	@RequestMapping(value="/admin/Employee/add-employee", method=RequestMethod.GET)
	public String addPositionEmployee(final Model model, final HttpServletRequest request, final HttpServletRequest response) {
		
//		model.addAttribute("newPositionhehe",new PositionEmployee());
		List<PositionEmployee> employees=positionService.findAll();
		model.addAttribute("newPositionhehe",employees);
//		return "common/manager/manageEmployee";
		return "common/manager/addEmployee";
	}
//	@RequestMapping(value="/manageEmployee/add-employee", method=RequestMethod.POST)
//	public String addPositionEmployee(final Model model, final HttpServletRequest request, final HttpServletResponse response, @ModelAttribute("newPositionhehe")PositionEmployee newPosition) {
//		
//		positionService.saveOrUpdate(newPosition);
//		
//		return "common/manager/addEmployee";
//	}
}
