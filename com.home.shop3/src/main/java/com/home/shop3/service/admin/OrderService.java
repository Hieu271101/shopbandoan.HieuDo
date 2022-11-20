package com.home.shop3.service.admin;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;

import com.home.shop3.entities.admin.OrderEntity;

import javax.persistence.Query;

import javax.persistence.Table;
import javax.transaction.Transactional;

@Service
public class OrderService {
	@PersistenceContext
	protected EntityManager entityManager;
	
	protected OrderEntity getById(int id) {
		return entityManager.find(OrderEntity.class, id);
	}
	
//	@SuppressWarnings("unchecked")
//	public List<OrderEntity>findAll(){
//		
//		Table tbl=OrderEntity.class.getAnnotation(Table.class);
//		return (List<OrderEntity>) entityManager.createNativeQuery("SELECT * FROM"+ tbl.name(),OrderEntity.class).getResultList();
//	}
	@SuppressWarnings("unchecked")
	public List<OrderEntity> findAll() {
		Table tbl = OrderEntity.class.getAnnotation(Table.class);
		return (List<OrderEntity>) entityManager.createNativeQuery("SELECT * FROM " + tbl.name(), OrderEntity.class).getResultList();
	}
	
	@Transactional
	public OrderEntity saveOrUpdate(OrderEntity entity) {
		if(entity.getId()<=0) {
			entityManager.persist(entity);
			return entity;
		}else {
			return entityManager.merge(entity);
		}
		
	}
	public void delete(OrderEntity entity) {
		entityManager.remove(entity);
	}
	public void deleteById(int id) {
		OrderEntity entity=this.getById(id);
		delete(entity);
	}
	
	@SuppressWarnings("unchecked")
	public List<OrderEntity> executeNativeSql(String sql){
		try {
			Query query=entityManager.createNativeQuery(sql,OrderEntity.class);
			return query.getResultList();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ArrayList<OrderEntity>();
		}
	}

	@SuppressWarnings("unchecked")
	public List<OrderEntity> findNearOrder() {
		Table tbl = OrderEntity.class.getAnnotation(Table.class);
		return (List<OrderEntity>) entityManager.createNativeQuery("SELECT * FROM " + tbl.name()+" order by id desc limit 5", OrderEntity.class).getResultList();
	}
	@SuppressWarnings("unchecked")
	public List<OrderEntity> findAllActive() {
		Table tbl = OrderEntity.class.getAnnotation(Table.class);
		return (List<OrderEntity>) entityManager.createNativeQuery("SELECT * FROM " + tbl.name()+" WHERE status = 1", OrderEntity.class).getResultList();
	}
	@SuppressWarnings("unchecked")
	public List<OrderEntity> findCancelOrder() {
		Table tbl = OrderEntity.class.getAnnotation(Table.class);
		return (List<OrderEntity>) entityManager.createNativeQuery("SELECT * FROM " + tbl.name()+" WHERE status = 0", OrderEntity.class).getResultList();
	}
	
}
