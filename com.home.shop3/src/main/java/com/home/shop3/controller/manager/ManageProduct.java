package com.home.shop3.controller.manager;

import javax.servlet.http.HttpServletRequest;    
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

//import com.devpro.javaWeb21.dto.Scribe;
//import com.devpro.javaWeb21.enitities.admin.Category;
//import com.devpro.javaWeb21.enitities.admin.Product;
import com.home.shop3.controller.BaseController;
import com.home.shop3.dto.manager.ProductSearchModel;
import com.home.shop3.entities.admin.CategoryEntity;
import com.home.shop3.entities.admin.PositionEmployee;
import com.home.shop3.entities.admin.ProductsEntity;
import com.home.shop3.service.PagerData;
import com.home.shop3.service.admin.CategoryService;
import com.home.shop3.service.admin.ProductsService;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
//import java.util.ArrayList;
import java.util.List;
import java.util.Map;
@Controller
public class ManageProduct extends BaseController {

	
	@Autowired
	ProductsService productsService;
	
	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		List<CategoryEntity>categories=categoryService.findAll();
		model.addAttribute("categories",categories);
		
		
		String keyword = request.getParameter("keyword");
		Integer categoryId = getInteger(request, "categoryId");

		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setCategoryId(categoryId);
		searchModel.setPage(getCurrentPage(request));
		
		PagerData<ProductsEntity> products = productsService.searchActive(searchModel);
		
		model.addAttribute("products", products);
		model.addAttribute("searchModel", searchModel);
		return "common/manager/manageProduct";
		
	}
	
	
	@RequestMapping(value = { "/admin/product/management/{productId}" }, method = RequestMethod.GET)
	public String adminProductDetail(final Model model, 
								   final HttpServletRequest request,
								   final HttpServletResponse response, 
								   @PathVariable("productId") int productId
								   ) throws IOException {

		// l???y product trong db theo ID
		ProductsEntity productInDatabase = productsService.getById(productId);
		model.addAttribute("newProduct", productInDatabase);
		
		// ?????y danh s??ch categories xu???ng t???ng view
//		List<CategoryEntity> categories = categoryService.executeNativeSql("SELECT * FROM tbl_category");
//		model.addAttribute("categories", categories); // ?????y data xu???ng view
		
		List<CategoryEntity> categories=categoryService.findAll();
		
		model.addAttribute("categories",categories);
		return "common/manager/addProduct";
		
	}

	
	@RequestMapping(value="/admin/product/management",method=RequestMethod.GET)
	public String addProduct(final Model model, final HttpServletRequest request,final HttpServletResponse response) {
		
		List<CategoryEntity>categories=categoryService.findAll();
		model.addAttribute("categories",categories);
		
		
		model.addAttribute("newProduct",new ProductsEntity());
		return "common/manager/addProduct";
	}
//	@RequestMapping(value="/admin/product/management",method=RequestMethod.GET)
//	public String adminProductAdd(final Model model, 
//								  final HttpServletRequest request,
//							  	  final HttpServletResponse response) throws IOException {
//		
//		
//		List<CategoryEntity>categories=categoryService.findAll();
//		model.addAttribute("categories",categories);
//		
//		// kh???i t???o 1 product(entity) m???i
//		ProductsEntity newProduct = new ProductsEntity();
//		model.addAttribute("newProduct", newProduct); // ?????y data xu???ng view
//		//request.getSession().setAttribute("product", newProduct); // ?????y data xu???ng view
//		
//		// ?????y danh s??ch categories xu???ng t???ng view
////		List<CategoryEntity> categories = categoryService.executeNativeSql("SELECT * FROM tbl_category");
////		model.addAttribute("categories", categories); // ?????y data xu???ng view
//		
//		// tr??? v??? view
//		return "common/manager/addProduct";
//		
//	}
//	
	
	@RequestMapping(value="/admin/product/management",method=RequestMethod.POST)
	public String adminProductAddOrUpdate(final Model model, 
										  final HttpServletRequest request,
										  final HttpServletResponse response, 
										  @ModelAttribute("newProduct") ProductsEntity product

										  ,@RequestParam("productAvatar") MultipartFile productAvatar
										  ,@RequestParam("productPictures") MultipartFile[] productPictures
	) throws Exception {

		// th??m m???i
		if (product.getId() == null || product.getId() <= 0) {
			productsService.add(product, productAvatar, productPictures);
		}
		// ch???nh s???a
		else
		{ 
			productsService.update(product, productAvatar, productPictures);
		}
		
//		productsService.saveOrUpdate(product);
		
		// tr??? v??? trang danh s??ch
//		return "redirect:/admin/product/list";
//		return "common/manager/addProduct";
		return "redirect:";
//		return "admin/product";
	}
	
//	@RequestMapping(value = { "/admin/product/management" }, method = RequestMethod.POST)
//	public String addProduct(final Model model,final HttpServletRequest request, final HttpServletResponse response,
//			@ModelAttribute("newProduct")ProductsEntity newProduct, 
//			@RequestParam("ImageUpload") MultipartFile attachmentFile )  throws IOException{
//		
//		if(!attachmentFile.isEmpty()) {
//			attachmentFile.transferTo(new File("C:\\Users\\Hieu\\shop3\\com.home.shop3\\src\\main\\java\\uploads\\" +attachmentFile.getOriginalFilename()));
//
//		}
//		Date date=new Date();
//		date=java.util.Calendar.getInstance().getTime();
//		newProduct.setCreatedDate(date);
//	
//		productsService.saveOrUpdate(newProduct);
//		return "common/manager/addProduct";
//	}
//	@RequestMapping(value = "/admin/product/management/delete", method=RequestMethod.GET)
//	public String scribe(final Model model, final HttpServletRequest request, final HttpServletResponse response)throws IOException{
//		return "customer/layout/sub";
//	}
	
	//c??ch 3: s??? d???ng Ajax
	//?????i v???i c??ch n??y th?? ch??? refresh 1 s??? ph???n c???a trang web kh??ng reload l???i
	//v???i ajax s??? kh??ng tr??? v??? view(refresh l???i) m?? tr??? v??? ki???u ResponseEntity c?? gi?? tr??? ki???u Map<String, Object>
	//@RequestBody d??ng ????? h???ng data
	@RequestMapping(value = { "/admin/product/management/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody ProductsEntity product) {
//		System.out.println(product.getName());
		
		ProductsEntity productInDbs=productsService.getById(product.getId());
		productInDbs.setStatus(false);
		productsService.saveOrUpdate(productInDbs);
		
//		System.out.println(contact.getMail());
		
		Map<String, Object> jsonResult = new HashMap<String, Object> ();
		jsonResult.put("statusCode", 200); // status code v?? d???: 200: Success, 500: Error, 404: NotFound
		jsonResult.put("statusMessage", "C???m ??n b???n "  + ", Ch??ng t??i s??? li??n h??? s???m nh???t!");
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/admin/product/add-category", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_addPosition(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody CategoryEntity category) {	
		System.out.println(category.getName());
		categoryService.saveOrUpdate(category);
		
		Map<String, Object> jsonResult = new HashMap<String, Object> ();
		jsonResult.put("statusCode", 200); // status code v?? d???: 200: Success, 500: Error, 404: NotFound
		jsonResult.put("statusMessage", "C???m ??n b???n ");
		return ResponseEntity.ok(jsonResult);
	}
	
}	
