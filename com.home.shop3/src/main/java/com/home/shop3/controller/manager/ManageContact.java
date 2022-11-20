package com.home.shop3.controller.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.shop3.entities.user.ContactEntity;
import com.home.shop3.service.user.ContactService;



@Controller
public class ManageContact {
	@Autowired
	protected ContactService contactService;
	
	@RequestMapping(value="/admin/contact",method=RequestMethod.GET)
	public String contact(final Model model,final HttpServletRequest response,final HttpServletRequest request ) {
		
		List<ContactEntity> listContact =contactService.findAll();
		
		model.addAttribute("listContact",listContact);

		return "common/manager/manageContact";
	}
}
