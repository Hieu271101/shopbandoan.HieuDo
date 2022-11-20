package com.home.shop3.service.admin;

import java.util.List; 

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.home.shop3.entities.admin.PositionEmployee;
import com.home.shop3.entities.user.User;
import com.home.shop3.service.BaseService;

@Service
public class PositionService extends BaseService<PositionEmployee> {

	@Override
	protected Class<PositionEmployee> clazz() {
		// TODO Auto-generated method stub
		return PositionEmployee.class;
	}
	
	public List<PositionEmployee> findAllAcitve() {
		String sql="SELECT *FROM position_table where status=1";
		return super.executeNativeSql(sql);
	}
	
	
	
	
//	@PersistenceContext
//	protected EntityManager entityManager;
//	
//	protected PositionEmployee getById(int id) {
//		return entityManager.find(PositionEmployee.class, id);
//	}
//	@SuppressWarnings("unchecked")
//	public List<PositionEmployee> findAll(){
//		Table tbl=PositionEmployee.class.getAnnotation(Table.class);
//		return (List<PositionEmployee>) entityManager.createNamedQuery("SELECT*FROM"+tbl.name(), PositionEmployee.class ).getResultList();
//	}
//	
//	@Transactional
//	public UserEntity saveOrUpdate(UserEntity entity) {
//		if(entity.getId()<=0) {
//			entityManager.persist(entity);
//			return entity;
//		}else {
//			return entityManager.merge(entity);
//		}
//	}
//	
	
	
	
	
}
