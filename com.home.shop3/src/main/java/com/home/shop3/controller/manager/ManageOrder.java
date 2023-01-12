package com.home.shop3.controller.manager;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
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
	@Autowired 
	protected OrderService orderService;
	
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
	

	
	@RequestMapping(value = { "/ajax/createBill" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_bill(final Model model, 
																	   final HttpServletRequest request,
																	   final HttpServletResponse response, 
																	   final @RequestBody SaleOrder saleOrder																	 																	  
																	   ) throws IOException {
		System.out.print(saleOrder.getId());
		SaleOrder saleOrderInDbs=saleOrderService.getById(saleOrder.getId());
		
		XWPFDocument document = new XWPFDocument();

        // Create a paragraph for the invoice title
        XWPFParagraph titleParagraph = document.createParagraph();
        titleParagraph.setAlignment(ParagraphAlignment.CENTER);
        XWPFRun titleRun = titleParagraph.createRun();
        titleRun.setBold(true);
        titleRun.setFontSize(18);
        titleRun.setText("BILL");

        // Create a paragraph for the invoice date
        XWPFParagraph dateParagraph = document.createParagraph();
        dateParagraph.setAlignment(ParagraphAlignment.RIGHT);
        XWPFRun dateRun = dateParagraph.createRun();
        dateRun.setText(String.valueOf(saleOrderInDbs.getCreatedDate()));

        // Create a paragraph for the customer information
        XWPFParagraph customerParagraph = document.createParagraph();
        XWPFRun customerRun = customerParagraph.createRun();
        customerRun.setText("Customer Name: "+ saleOrderInDbs.getCustomerName());
        customerRun.addBreak();
        customerRun.setText("Address: "+ saleOrder.getCustomerAddress());
        customerRun.addBreak();
        customerRun.setText("Email: "+ saleOrder.getCustomerEmail());
        customerRun.addBreak();
        customerRun.setText("Phone: "+saleOrder.getCustomerPhone());

        // Create a table for the invoice items
        XWPFTable itemsTable = document.createTable(3, 3);
        itemsTable.getRow(0).getCell(0).setText("Item");
        itemsTable.getRow(0).getCell(1).setText("Quantity");
        itemsTable.getRow(0).getCell(2).setText("Price");
        itemsTable.getRow(1).getCell(0).setText("Widget");
        itemsTable.getRow(1).getCell(1).setText("2");
        itemsTable.getRow(1).getCell(2).setText("$10.00");
        itemsTable.getRow(2).getCell(0).setText("Gadget");
        itemsTable.getRow(2).getCell(1).setText("1");
        itemsTable.getRow(2).getCell(2).setText("$20.00");

        // Create a paragraph for the total
        XWPFParagraph totalParagraph = document.createParagraph();
        XWPFRun totalRun = totalParagraph.createRun();
        totalRun.setText("Total: $30.00");
  
    // Write the Document in file system
    FileOutputStream out = new FileOutputStream(new File("demo-apache-apoi-word.docx"));
    System.out.print(new File("demo-apache-apoi-word.docx").getAbsolutePath());
    document.write(out);
    out.close();
    document.close();
    System.out.println("successully");
	
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");

		

		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/ajax/undertakeBill" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_undertakeBill(final Model model, 
																	   final HttpServletRequest request,
																	   final HttpServletResponse response, 
																	   final @RequestBody SaleOrder saleOrder																	 																	  
																	   ) throws IOException {
//		System.out.println(saleOrder.getId());
//		System.out.println(saleOrder.getUndertake());
		SaleOrder saleOrderInDbs=saleOrderService.getById(saleOrder.getId());
		Date date=new Date();
		date=java.util.Calendar.getInstance().getTime();
		saleOrderInDbs.setUndertake(saleOrder.getUndertake()+"<br>"+date);
		
		saleOrderService.saveOrUpdate(saleOrderInDbs);
		System.out.println("successully");
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("undertake", saleOrder.getUndertake()+"<br>"+date);
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");

		

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
