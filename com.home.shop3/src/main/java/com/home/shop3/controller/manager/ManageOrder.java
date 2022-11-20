package com.home.shop3.controller.manager;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;

import com.home.shop3.controller.BaseController;
import com.home.shop3.dto.BaseSearchModel;
import com.home.shop3.dto.manager.OrderSearchModel;
import com.home.shop3.dto.manager.ProductSearchModel;
import com.home.shop3.dto.user.CartItems;
import com.home.shop3.dto.user.Carts;
import com.home.shop3.dto.user.SaleOrder;
import com.home.shop3.dto.user.SaleOrderProduct;
import com.home.shop3.entities.admin.CategoryEntity;
import com.home.shop3.entities.admin.OrderEntity;
import com.home.shop3.entities.admin.ProductsEntity;
import com.home.shop3.service.PagerData;
import com.home.shop3.service.admin.OrderService;
import com.home.shop3.service.user.SaleOrderProductService;
import com.home.shop3.service.user.SaleOrderService;

@Controller
public class ManageOrder extends BaseController {
//	@Autowired 
//	protected OrderService orderService;
	
	@Autowired
	protected SaleOrderService saleOrderService;
	
	@Autowired
	protected SaleOrderProductService saleOrderProductService;
	
	@RequestMapping(value="/admin/order",method =RequestMethod.GET )
	public String order(final Model model,final HttpServletRequest request,final HttpServletResponse response) throws IOException{
		
		String keyword = request.getParameter("keyword");
		OrderSearchModel searchModel = new OrderSearchModel();
		
		searchModel.setKeyword(keyword);
		searchModel.setPage(getCurrentPage(request));
		
//		PagerData<OrderEntity> orders=saleOrderService.;
		
		PagerData<SaleOrder> orders = saleOrderService.search(searchModel);
		model.addAttribute("orders", orders);
		model.addAttribute("searchModel", searchModel);
		
		
		
		
//		List<SaleOrder>orders=saleOrderService.findAll();
//		model.addAttribute("orders",orders);
		return "/common/manager/manageOrder";
	}
	@RequestMapping(value="/admin/order/management",method=RequestMethod.GET)
	public String manageOrder(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response)throws IOException {
		
		SaleOrder newSaleOrder = new SaleOrder();
		model.addAttribute("newOrder",newSaleOrder);
	
		return "common/manager/addOrder";
	}
	
	@RequestMapping(value = { "/admin/order/{orderId}" }, method = RequestMethod.GET)
	public String adminProductDetail(final Model model, 
								   final HttpServletRequest request,
								   final HttpServletResponse response, 
								   @PathVariable("orderId") int orderId
								   
								   ) throws IOException {

		// lấy product trong db theo ID
		SaleOrder saleOrderInDatabase = saleOrderService.getById(orderId);
		model.addAttribute("newOrder", saleOrderInDatabase);
		
		return "common/manager/addOrder";
		
	}
	
	@RequestMapping(value="/admin/order/management",method=RequestMethod.POST)
	public String adminOrderAddOrUpdate(final Model model, 
										  final HttpServletRequest request,
										  final HttpServletResponse response, 
										  @ModelAttribute("newOrder") SaleOrder order								
										 
	) throws Exception {

		saleOrderService.saveOrUpdate(order);
		
		// trở về trang danh sách

//		return "redirect:";
//		return "admin/product";
		return "common/manager/addOrder";
	}
	
	
	@RequestMapping(value = { "/ajax/updateQuanlitySaleOrder" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_UpdateQuanlityCart(final Model model, 
																	   final HttpServletRequest request,
																	   final HttpServletResponse response, 
																	   final @RequestBody SaleOrderProduct saleOrderProduct
//																	   ,@ModelAttribute("newOrder") SaleOrder order
																	  
																	   ) {
//		System.out.println("vao den day chua");
//		System.out.println(saleOrderProduct.getId());
//		System.out.println(saleOrderProduct.getQuanlity());
		SaleOrderProduct saleOrderProductInDbs=saleOrderProductService.getById(saleOrderProduct.getId());
		
		
		int currentProductQuality = saleOrderProductInDbs.getQuanlity()+saleOrderProduct.getQuanlity();
		
		saleOrderProductInDbs.setQuanlity(currentProductQuality);
		if(currentProductQuality<0) {
			currentProductQuality=0;
		}
		saleOrderProductService.saveOrUpdate(saleOrderProductInDbs);
		
		
		SaleOrder saleOrderInDatabase = saleOrderService.getById(saleOrderProductInDbs.getSaleOrders().getId());
		Set<SaleOrderProduct> cartItems = saleOrderInDatabase.getSaleOrderProducts();
		BigDecimal total = BigDecimal.ZERO;
		
		for(SaleOrderProduct ci : cartItems) {
			
			total = total.add(ci.getProducts().getPrice().multiply(BigDecimal.valueOf(ci.getQuanlity())));
		}
	
		saleOrderInDatabase.setTotal(total);
		saleOrderService.saveOrUpdate(saleOrderInDatabase);
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
//		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuanlity", currentProductQuality);
//		jsonResult.put("totalPrice", formatCurrency(calculateTotalPrice(request)));

//		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	
//	@RequestMapping(value = { "/admin/order/management/delete" }, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
//															final HttpServletRequest request,
//															final HttpServletResponse response, 
//															final @RequestBody SaleOrderService order) {
////		System.out.println(product.getName());
//		
//		ProductsEntity productInDbs=productsService.getById(order.getId());
//		productInDbs.setStatus(false);
//		saleOrderService.saveOrUpdate(productInDbs);
//		
////		System.out.println(contact.getMail());
//		
//		Map<String, Object> jsonResult = new HashMap<String, Object> ();
//		jsonResult.put("statusCode", 200); // status code ví dụ: 200: Success, 500: Error, 404: NotFound
//		jsonResult.put("statusMessage", "Cảm ơn bạn "  + ", Chúng tôi sẽ liên hệ sớm nhất!");
//		return ResponseEntity.ok(jsonResult);
//	}
	
}
