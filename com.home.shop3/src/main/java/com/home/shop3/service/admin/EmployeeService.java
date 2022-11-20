package com.home.shop3.service.admin;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.home.shop3.entities.admin.EmployeeEntity;
import com.home.shop3.entities.admin.ProductImages;
import com.home.shop3.entities.admin.ProductsEntity;
import com.home.shop3.service.BaseService;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;
@Service
public class EmployeeService extends BaseService<EmployeeEntity> {

	@Override
	protected Class<EmployeeEntity> clazz() {
		// TODO Auto-generated method stub
		return EmployeeEntity.class;
	}
	
	public List<EmployeeEntity> findAllActive(){
		String sql="SELECT *FROM  tbl_employee where status=1";
		return super.executeNativeSql(sql);
	}
	public List<EmployeeEntity> findNoActive(){
		String sql="SELECT *FROM  tbl_employee where status=0";
		return super.executeNativeSql(sql);
	}
	public List<EmployeeEntity> findNearRegister(){
		String sql="SELECT *FROM  tbl_employee where status=1 order by  created_date desc limit 5";
		return super.executeNativeSql(sql);
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
	public EmployeeEntity add(EmployeeEntity p, MultipartFile imgEmployee)
			throws IllegalStateException, IOException {
//
//		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(imgEmployee)) { // có đẩy avatar lên.
			
			String fileName = getUniqueUploadFileName(imgEmployee.getOriginalFilename());
			
			// tạo đường dẫn tới folder chứa avatar
			String pathToAvatar = "C:/upload/employee/avatar/" + fileName;

			// lưu avatar vào đường dẫn trên
			imgEmployee.transferTo(new File(pathToAvatar));

			p.setAvatar("employee/avatar/" + fileName);
		}

		// có đẩy pictures(product_images) ???
		

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
		
	}
	
	@Transactional
	public EmployeeEntity update(EmployeeEntity p, MultipartFile employeeAvatar)
			throws IllegalStateException, IOException {
		
//		EmployeeEntity productImagesService=new EmployeeEntity();
		
		// lấy thông tin cũ của product theo id
		EmployeeEntity productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(employeeAvatar)) {
			// xóa avatar trong folder lên
			new File("C:/upload/" + productInDb.getAvatar()).delete();

			// update avatar mới
			String fileName = getUniqueUploadFileName(employeeAvatar.getOriginalFilename());
			employeeAvatar.transferTo(new File("C:/upload/employee/avatar/" + fileName));
			p.setAvatar("employee/avatar/" + fileName);
		} 
		else {
			// sử dụng lại avartar cũ
			p.setAvatar(productInDb.getAvatar());
		}

		return super.saveOrUpdate(p);
	}
	
	
}
