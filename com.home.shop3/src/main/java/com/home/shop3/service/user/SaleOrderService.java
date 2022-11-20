package com.home.shop3.service.user;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.home.shop3.dto.manager.OrderSearchModel;
import com.home.shop3.dto.manager.ProductSearchModel;
import com.home.shop3.dto.user.SaleOrder;
import com.home.shop3.entities.admin.ProductsEntity;
//import com.home.shop3.entities.BaseEntity;
import com.home.shop3.service.BaseService;
import com.home.shop3.service.PagerData;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}
	public PagerData<SaleOrder> search(OrderSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder  p WHERE 1=1";

		if (searchModel != null) {
			
			
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.customer_name like '%" + searchModel.getKeyword() + "%'"
						+
						" or p.customer_phone like '%" + searchModel.getKeyword() + "%'"
						+
						" or p.code like '%" + searchModel.getKeyword() + "%'" 
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
