package com.home.shop3.controller.manager;

import java.io.IOException;
import java.util.HashMap; 
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

import com.home.shop3.controller.BaseController;
import com.home.shop3.entities.admin.CategoryEntity;
import com.home.shop3.entities.admin.ProductsEntity;
import com.home.shop3.entities.user.Role;
import com.home.shop3.entities.user.User;
import com.home.shop3.service.admin.RoleService;
import com.home.shop3.service.user.UserService;

@Controller
public class ManageUser extends BaseController  {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "/admin/user",method = RequestMethod.GET)
	public String user(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
//		List<User> list=userService.findActiveUser();
		List<User> list=userService.findNotAdmin();
		model.addAttribute("list",list);
		return "common/manager/manageUser";
	}
	
	@RequestMapping(value="/admin/user/management", method = RequestMethod.GET)
	public String userInf(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
//		List<User> list=userService.findActiveUser();
		/* List<User> list=userService.findAll(); */
		model.addAttribute("newUser",new User());
		return "common/manager/addUser";
	}
//	
//	@RequestMapping(value="/admin/user/management", method = RequestMethod.POST)
//	public String userEdit(final Model model, final HttpServletRequest request, 
//			final HttpServletResponse response,
//			@ModelAttribute User newUser) throws Exception {
////		List<User> list=userService.findActiveUser();
//		/* List<User> list=userService.findAll(); */
//		
////		model.addAttribute("newUser",new User());
//		userService.saveOrUpdate(newUser);
//		return "common/manager/manageUser";
//	}
//
	@RequestMapping(value = { "/admin/user/management/{userId}" }, method = RequestMethod.GET)
	public String adminProductDetail(final Model model, 
								   final HttpServletRequest request,
								   final HttpServletResponse response, 
								   @PathVariable("userId") int userId
								   ) throws IOException {

		// lấy product trong db theo ID
		User userInDatabase = userService.getById(userId);
		model.addAttribute("newUser", userInDatabase);
		
		// đẩy danh sách categories xuống tầng view
//		List<CategoryEntity> categories = categoryService.executeNativeSql("SELECT * FROM tbl_category");
//		model.addAttribute("categories", categories); // đẩy data xuống view
		
		
		return "common/manager/addUser";
		
	}
	
	
	@RequestMapping(value="/admin/user/management/changeToAdmin", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> changToAdmin(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody User user) {
//		System.out.println(product.getName());
		
		User userInDbs=userService.getById(user.getId());
		Role roleUser=roleService.getById(2);
		userInDbs.deleteRole(roleUser);
		
		Role role=roleService.getById(3);
		userInDbs.addRoles(role);
		
		userService.saveOrUpdate(userInDbs);
		

		
		Map<String, Object> jsonResult = new HashMap<String, Object> ();
		jsonResult.put("statusCode", 200); // status code ví dụ: 200: Success, 500: Error, 404: NotFound
		jsonResult.put("statusMessage", "Cảm ơn bạn "  + ", Chúng tôi sẽ liên hệ sớm nhất!");
		return ResponseEntity.ok(jsonResult);
	}
	
	
	
	
	@RequestMapping(value = { "/admin/user/management/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody User user) {
//		System.out.println(product.getName());
		
		User productInDbs=userService.getById(user.getId());
		productInDbs.setStatus(false);
		userService.saveOrUpdate(productInDbs);
		

		
		Map<String, Object> jsonResult = new HashMap<String, Object> ();
		jsonResult.put("statusCode", 200); // status code ví dụ: 200: Success, 500: Error, 404: NotFound
		jsonResult.put("statusMessage", "Cảm ơn bạn "  + ", Chúng tôi sẽ liên hệ sớm nhất!");
		return ResponseEntity.ok(jsonResult);
	}
	
}
