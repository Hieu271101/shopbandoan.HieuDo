package com.home.shop3.controller.user;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//import com.home.shop3.dto.user.Cart;
import java.util.HashMap;
import java.util.Iterator;

import com.home.shop3.controller.BaseController;
import com.home.shop3.dto.user.CartItems;
import com.home.shop3.dto.user.Carts;
import com.home.shop3.dto.user.SaleOrder;
import com.home.shop3.dto.user.SaleOrderProduct;
import com.home.shop3.service.admin.ProductsService;
import com.home.shop3.service.user.SaleOrderService;



@Controller
public class Cart extends BaseController {
	
	@Autowired
	private ProductsService productsService;
	
	@Autowired 
	private SaleOrderService saleOrderService;
	
	@RequestMapping(value = "/cart", method=RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse respose) throws IOException{
		return "common/user/carts";
	}
	
	@RequestMapping(value = { "/cart" }, method = RequestMethod.POST)
	public String cartFinished(final Model model, 
						   final HttpServletRequest request, 
						   final HttpServletResponse response
						   ) throws IOException {
		
		
		// Lấy thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		String customerAddress = request.getParameter("customerAddress");
		
		// tạo hóa đơn + với thông tin khách hàng lấy được
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCustomerName(customerFullName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);	
		saleOrder.setDescription("Đang xử li");
		
		saleOrder.setCode(String.valueOf(System.currentTimeMillis())); // mã hóa đơn
//		saleOrder.setTotal(BigDecimal.valueOf(
//				Double.parseDouble(
//						request.getParameterValues("total_price_product")
//						)
//				));
		
		
		// lấy giỏ hàng
		HttpSession session = request.getSession();
		Carts cart = (Carts) session.getAttribute("cart");
//		double totalPriceOfCart=0;
		// lấy sản phẩm trong giỏ hàng
		double total=0;
		for (CartItems cartItem : cart.getCartItems()) {
			SaleOrderProduct saleOrderProducts = new SaleOrderProduct();
			saleOrderProducts.setProducts(productsService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuanlity(cartItem.getQuanlity());
		
			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
			total=total+cartItem.getPriceUnit().doubleValue()*cartItem.getQuanlity();

		}
		saleOrder.setTotal(BigDecimal.valueOf(total));
		// lưu vào database
		saleOrderService.saveOrUpdate(saleOrder);
		
		// thực hiện reset lại giỏ hàng của Session hiện tại
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", 0);
		
		return "common/user/success"; // -> đường dẫn tới View.
		
	}
	
	@RequestMapping(value = { "/ajax/updateQuanlityCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_UpdateQuanlityCart(final Model model, 
																	   final HttpServletRequest request,
																	   final HttpServletResponse response, 
																	   final @RequestBody CartItems cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Carts cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Carts) session.getAttribute("cart");
		} else {
			cart = new Carts();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItems> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		int currentProductQuality = 1;
//		System.out.println(cartItem.getProductId());
		for (CartItems item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				currentProductQuality = item.getQuanlity() + cartItem.getQuanlity();
				if(currentProductQuality<0) {
					currentProductQuality=0;
				}
				item.setQuanlity(currentProductQuality);				
			}
		}
		

		// tính tổng tiền
		this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);
		jsonResult.put("totalPrice", formatCurrency(calculateTotalPrice(request)));

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/ajax/deleteItemCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_DeleteItemCart(final Model model, 
																	   final HttpServletRequest request,
																	   final HttpServletResponse response, 
																	   final @RequestBody CartItems cartItem) throws Exception {
//		System.out.println(cartItem.getProductId());
		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Carts cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Carts) session.getAttribute("cart");
		} else {
			cart = new Carts();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItems> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		int count = 0;
//		System.out.println(cartItem.getProductId());
		try {
			for (CartItems item : cartItems) {
				if (item.getProductId() == cartItem.getProductId()) {
						cartItems.remove(count);
				}
				count=count++;
			}
			cart.setCartItems(cartItems);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
//		
		

		// tính tổng tiền
		this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
//		jsonResult.put("currentProductQuality", currentProductQuality);
		jsonResult.put("totalPrice", formatCurrency(calculateTotalPrice(request)));

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	
	
	private String formatCurrency(BigDecimal value) {
		Locale loc = new Locale("vi", "VN");
	    NumberFormat nf = NumberFormat.getCurrencyInstance(loc);
	    return nf.format(value);
	}
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Carts cart = (Carts) httpSession.getAttribute("cart");
		List<CartItems> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItems item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}
	
	private BigDecimal calculateTotalPrice(final HttpServletRequest request) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Carts cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Carts) session.getAttribute("cart");
		} else {
			cart = new Carts();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItems> cartItems = cart.getCartItems();
		BigDecimal total = BigDecimal.ZERO;
		
		for(CartItems ci : cartItems) {
			total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
		}

		cart.setTotalPrice(total);
		
		return total;
	}
	
	
}
