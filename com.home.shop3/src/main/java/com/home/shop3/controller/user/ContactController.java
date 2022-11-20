package com.home.shop3.controller.user;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.shop3.controller.BaseController;
import com.home.shop3.entities.user.ContactEntity;
import com.home.shop3.service.user.ContactService;

@Controller
public class ContactController extends BaseController {
	
	@Autowired
	protected ContactService contactService;
	
	@RequestMapping(value = "/contact", method=RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse respose) throws IOException{

		ContactEntity contact=new ContactEntity();
		model.addAttribute("newContact", contact);

		return "common/user/contact";
	}
	@RequestMapping(value="/contact", method=RequestMethod.POST)
	public String contact(final Model model, final HttpServletRequest request,final HttpServletResponse response, @ModelAttribute("newContact") ContactEntity contact ) {
		Date date=new Date();
		date=java.util.Calendar.getInstance().getTime();
//		System.out.println(date);
//		System.out.println(java.time.LocalDateTime.now());
		contact.setCreatedDate(date);
//		System.out.println(contact.getName());
		contactService.saveOrUpdate(contact);
		return "redirect:";
	}
}
