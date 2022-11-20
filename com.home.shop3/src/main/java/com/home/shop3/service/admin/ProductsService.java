package com.home.shop3.service.admin;

import org.springframework.stereotype.Service;  


import com.home.shop3.dto.manager.ProductSearchModel;
import com.home.shop3.entities.admin.ProductImages;
import com.home.shop3.entities.admin.ProductsEntity;
import com.home.shop3.service.BaseService;
import com.home.shop3.service.PagerData;

import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;


import javax.transaction.Transactional;
@Service
public class ProductsService extends BaseService<ProductsEntity> {
	@Override
	protected Class<ProductsEntity> clazz(){
			return ProductsEntity.class;
			
	}
	public List<ProductsEntity> findAllActive(){
		String sql="SELECT *FROM tbl_product where status=1";
		return super.executeNativeSql(sql);
	}
	
	public List<ProductsEntity> findNearOver(){
		String sql="SELECT *FROM tbl_product where amount<3";
		return super.executeNativeSql(sql);
	}
	
	public List<ProductsEntity> findOver(){
		String sql="SELECT *FROM tbl_product where amount=0";
		return super.executeNativeSql(sql);
	}
	public List<ProductsEntity> findHotProduct(){
		String sql="SELECT *FROM tbl_product where hot=1";
		return super.executeNativeSql(sql);
	}
	
	public PagerData<ProductsEntity> search(ProductSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_product  p WHERE 1=1";

		if (searchModel != null) {
			
			// tìm kiếm theo category
			if(searchModel.getCategoryId() != null && searchModel.getCategoryId() > 0) {
				sql += " and category_id = " + searchModel.getCategoryId();
			}
		
			// tìm theo seo
//					if (!StringUtils.isEmpty(searchModel.seo)) {
//						sql += " and p.seo = '" + searchModel.seo + "'";
//					}

			// tìm kiếm sản phẩm hot
//					if (searchModel.isHot != null) {
//						sql += " and p.is_hot = '" + searchModel.seo + "'";
//					}
			
			// tìm kiếm theo title và description
//			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
//				sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + 
//						     " or p.detail_description like '%" + searchModel.getKeyword() + "%'" + 
//						     " or p.short_description like '%" + searchModel.getKeyword() + "%')";
//			}
			
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.name like '%" + searchModel.getKeyword() + "%'"
						+
						" or p.description like '%" + searchModel.getKeyword() + "%'"
						+
						")";

//						     " or p.description like '%" + searchModel.getKeyword() + "%'" + "%') "
						;
			}
			
		}

		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";
		
		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
	
	
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * @param image
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	
	private String getUniqueUploadFileName(String fileName) {
		String[] splitFileName = fileName.split("\\.");
		return splitFileName[0] + System.currentTimeMillis() + "." + splitFileName[1];
	}
	
	@Transactional
	public ProductsEntity add(ProductsEntity p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {
//
//		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) { // có đẩy avatar lên.
			
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			
			// tạo đường dẫn tới folder chứa avatar
			String pathToAvatar = "C:/upload/product/avatar/" + fileName;

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToAvatar));

			p.setAvatar("product/avatar/" + fileName);
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(productPictures)) { // có đẩy pictures lên.

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				
				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File("C:/upload/product/pictures/" + fileName));

				// tạo mới 1 bản ghi product_images
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + fileName);

				pi.setTitle(fileName);
				p.addProductImages(pi);
			}
		}

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
		
	}
	
	@Transactional
	public ProductsEntity update(ProductsEntity p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {
		
		ProductImagesService productImagesService=new ProductImagesService();
		
		// lấy thông tin cũ của product theo id
		ProductsEntity productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File("C:/upload/" + productInDb.getAvatar()).delete();

			// update avatar mới
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			productAvatar.transferTo(new File("C:/upload/product/avatar/" + fileName));
			p.setAvatar("product/avatar/" + fileName);
		} 
		else {
			// sử dụng lại avartar cũ
			p.setAvatar(productInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getImgs() != null && productInDb.getImgs().size() > 0) {
				for (ProductImages opi : productInDb.getImgs()) {
					// xóa avatar trong folder lên
					new File("C:/upload/" + opi.getPath()).delete();

					// xóa dữ liệu trong database
					productImagesService.delete(opi);
				}
			}

			// update pictures mới
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				
				pic.transferTo(new File("C:/upload/product/pictures/" + fileName));
				
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);
				
				p.addProductImages(pi);
			}
		}

		//tạo seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}
	
	public PagerData<ProductsEntity> searchActive(ProductSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_product  p WHERE 1=1 and status=1";

		if (searchModel != null) {
			
			// tìm kiếm theo category
			if(searchModel.getCategoryId() != null && searchModel.getCategoryId() > 0) {
				sql += " and category_id = " + searchModel.getCategoryId();
			}
		
			// tìm theo seo
//					if (!StringUtils.isEmpty(searchModel.seo)) {
//						sql += " and p.seo = '" + searchModel.seo + "'";
//					}

			// tìm kiếm sản phẩm hot
//					if (searchModel.isHot != null) {
//						sql += " and p.is_hot = '" + searchModel.seo + "'";
//					}
			
			// tìm kiếm theo title và description
//			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
//				sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + 
//						     " or p.detail_description like '%" + searchModel.getKeyword() + "%'" + 
//						     " or p.short_description like '%" + searchModel.getKeyword() + "%')";
//			}
			
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.name like '%" + searchModel.getKeyword() + "%'"
						+
						" or p.description like '%" + searchModel.getKeyword() + "%'"
						+
						")";

//						     " or p.description like '%" + searchModel.getKeyword() + "%'" + "%') "
						;
			}
			
		}

		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";
		
		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
	
}
