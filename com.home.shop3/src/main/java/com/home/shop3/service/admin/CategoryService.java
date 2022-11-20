package com.home.shop3.service.admin;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.home.shop3.entities.admin.CategoryEntity;
import com.home.shop3.entities.admin.PositionEmployee;
import com.home.shop3.service.BaseService;


@Service
public class CategoryService extends BaseService<CategoryEntity>  {

	@Override
	protected Class<CategoryEntity> clazz() {
		// TODO Auto-generated method stub
		return CategoryEntity.class;
	}
//	@PersistenceContext
//	protected EntityManager entityManager;
//	
//	protected CategoryEntity getById(int id) {
//		return entityManager.find(CategoryEntity.class, id);
//	}
//	
//	@SuppressWarnings("unchecked")
//	public List<CategoryEntity>findAll(){
//		
//		Table tbl=CategoryEntity.class.getAnnotation(Table.class);
//		return (List<CategoryEntity>) entityManager.createNativeQuery("SELECT * FROM "+ tbl.name(),CategoryEntity.class).getResultList();
//	}
//	
//	
//	
//	@Transactional
//	public CategoryEntity saveOrUpdate(CategoryEntity entity) {
//		if(entity.getId()<=0) {
//			entityManager.persist(entity);
//			return entity;
//		}else {
//			return entityManager.merge(entity);
//		}
//		
//	}
//	public void delete(CategoryEntity entity) {
//		entityManager.remove(entity);
//	}
//	public void deleteById(int id) {
//		CategoryEntity entity=this.getById(id);
//		delete(entity);
//	}
//	
//	@SuppressWarnings("unchecked")
//	public List<CategoryEntity> executeNativeSql(String sql){
//		try {
//			Query query=entityManager.createNativeQuery(sql,CategoryEntity.class);
//			return query.getResultList();
//		}catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			return new ArrayList<CategoryEntity>();
//		}
//	}

}
