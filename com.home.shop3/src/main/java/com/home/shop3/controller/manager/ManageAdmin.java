package com.home.shop3.controller.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException.BadRequest;

import com.home.shop3.controller.BaseController;
import com.home.shop3.entities.admin.EmployeeEntity;
import com.home.shop3.entities.user.Role;
import com.home.shop3.entities.user.User;
import com.home.shop3.service.admin.RoleService;
import com.home.shop3.service.user.UserService;

@Controller
public class ManageAdmin  extends BaseController{
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@RequestMapping(value = "/admin/admin1", method = RequestMethod.GET)
	public String manageAdmin(final Model model,final HttpServletRequest request, final HttpServletResponse response) {
		List<User> list=userService.findIsAdmin();
		model.addAttribute("list",list);
		return "common/manager/manageAdmin";
	}
	@RequestMapping(value="/admin/user/management/changeToUser", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> changToAdmin(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody User user) {
//		System.out.println(product.getName());
		
		User userInDbs=userService.getById(user.getId());
		Role roleUser=roleService.getById(3);
		userInDbs.deleteRole(roleUser);
		
		Role role=roleService.getById(2);
		userInDbs.addRoles(role);
		
		userService.saveOrUpdate(userInDbs);
		

		
		Map<String, Object> jsonResult = new HashMap<String, Object> ();
		jsonResult.put("statusCode", 200); // status code ví dụ: 200: Success, 500: Error, 404: NotFound
		jsonResult.put("statusMessage", "Cảm ơn bạn "  + ", Chúng tôi sẽ liên hệ sớm nhất!");
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = "/admin/createAdminAccount", method =RequestMethod.GET)
	public String creatAdminAccount(final Model model,final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("newEmployee",new EmployeeEntity());
		return "common/manager/AdminRegister";
	}
}
