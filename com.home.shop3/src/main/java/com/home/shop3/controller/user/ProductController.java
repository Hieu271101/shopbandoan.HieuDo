package com.home.shop3.controller.user;

import java.io.IOException; 
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.print.attribute.standard.PrinterInfo;
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
import com.home.shop3.dto.manager.ProductSearchModel;
//import com.home.shop3.dto.user.Cart;
import com.home.shop3.dto.user.CartItems;
import com.home.shop3.dto.user.Carts;
import com.home.shop3.entities.admin.CategoryEntity;
import com.home.shop3.entities.admin.ProductsEntity;
import com.home.shop3.service.PagerData;
import com.home.shop3.service.admin.CategoryService;
import com.home.shop3.service.admin.ProductsService;

@Controller
public class ProductController extends BaseController  {
	
	@Autowired
	ProductsService productsService=new ProductsService();
	
	@Autowired
	CategoryService categoryService;
	

	// 
	@RequestMapping(value = { "/product/{productId}" }, method = RequestMethod.GET)
	public String adminProductDetail(final Model model, 
								   final HttpServletRequest request,
								   final HttpServletResponse response, 
								   @PathVariable("productId") int productId
								   ) throws IOException {
		HttpSession session=request.getSession();
		
		// lấy product trong db theo ID
		ProductsEntity productInDatabase = productsService.getById(productId);
		model.addAttribute("Product", productInDatabase);
		session.setAttribute("totalItems", getTotalItems(request));
		session.setAttribute("totalPrice", formatCurrency(calculateTotalPrice(request)));
//		System.out.println(this.calculateTotalPrice(request));
		// đẩy danh sách categories xuống tầng view
//		List<CategoryEntity> categories = categoryService.executeNativeSql("SELECT * FROM tbl_category");
//		model.addAttribute("categories", categories); // đẩy data xuống view
//		List<CategoryEntity> categories=categoryService.findAll();
//		model.addAttribute("categories",categories);
		return "common/user/detail_product";
		
	}
	
	
	@RequestMapping(value="/product/{productId}",method=RequestMethod.POST)
	public ResponseEntity< Map<String, Object>> addToCart(
			final Model model,
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@ModelAttribute("Product") ProductsEntity newProduct,
			@RequestBody CartItems newItem)throws IOException{
		
//		ProductsEntity productInDatabase = productsService.getById(productId);
		
		model.addAttribute("Product", newProduct);
		
		HttpSession session=request.getSession();
		
		Carts cart=null;
		
		if(session.getAttribute("cart")!=null) {
			cart=(Carts)session.getAttribute("cart");
			
		}else {
			cart=new Carts();
			session.setAttribute("cart",cart);
		}
	
		List<CartItems> cartItems=cart.getCartItems();
		
		BigDecimal total = BigDecimal.ZERO;
		
		for(CartItems ci : cartItems) {
			total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity()+1)));
		}
		cart.setTotalPrice(total);
		
		
		boolean isExist=false;
		BigDecimal itemTotalPrice=BigDecimal.ZERO;
//		itemTotalPrice.add(itemTotalPrice)
		for(CartItems item:cartItems) {
			if(item.getProductId()==newItem.getProductId()) {
				isExist=true;
				item.setQuanlity(item.getQuanlity()+newItem.getQuanlity());
				
//				item.setToltalPriceItem(itemTotalPrice.add(BigDecimal.valueOf(item.getQuanlity()).multiply(newItem.getPriceUnit()))) ;
			}
		}
		for(CartItems ci:cartItems) {
			if(ci.getProductId()==newItem.getProductId()) {
				ci.setToltalPriceItem(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
			}
		}
		
		if(!isExist) {
			ProductsEntity productInDb=productsService.getById(newItem.getProductId());
			
			newItem.setProductName(productInDb.getName());
			newItem.setPriceUnit(productInDb.getPrice());
			newItem.setAvatar(productInDb.getAvatar());
//			newItem.setToltalPriceItem(BigDecimal.valueOf(cartItems.).multiply(newItem.getPriceUnit()));
			cart.getCartItems().add(newItem);
		}
		
		Map<String, Object>jsonResult=new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		
		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
		
		
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
	
	
	private String formatCurrency(BigDecimal value) {
		Locale loc = new Locale("vi", "VN");
	    NumberFormat nf = NumberFormat.getCurrencyInstance(loc);
	    return nf.format(value);
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
	
	
	@RequestMapping(value = { "/product" }, method = RequestMethod.GET)
	public String ProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		List<CategoryEntity>categories=categoryService.findAll();
		model.addAttribute("categories",categories);
		
		
		String keyword = request.getParameter("keyword");
		Integer categoryId = getInteger(request, "banhkem");

		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setCategoryId(categoryId);
		searchModel.setPage(getCurrentPage(request));
		
		PagerData<ProductsEntity> products = productsService.searchActive(searchModel);
		
		model.addAttribute("products", products);
		model.addAttribute("searchModel", searchModel);
		return "common/user/product_new";
		
	}

}
