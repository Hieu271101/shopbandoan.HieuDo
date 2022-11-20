package com.home.shop3.service.user;

//import java.util.ArrayList;  
import java.util.List; 

import org.springframework.stereotype.Service;


import com.home.shop3.entities.user.User;
import com.home.shop3.service.BaseService;


@Service
public class UserService extends BaseService<User> {
	
	@Override
	protected Class<User> clazz(){
			return User.class;
	}
	public List<User> findActiveUser(){
		String sql="SELECT *FROM tbl_users where status=1 ";
		return super.executeNativeSql(sql);
	}
	
	public List<User> findNearUser(){
		String sql="SELECT * FROM tbl_users order by created_date desc limit 5";
		return super.executeNativeSql(sql);
	}
	
	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "' and status = 1";
		return this.getEntityByNativeSQL(sql);
	}
	
	public List<User> findNotAdmin(){
		String sql="SELECT * FROM tbl_users where status=1 and  exists(select * from `tbl_users_roles` where `tbl_users`.id =`tbl_users_roles`.user_id and `tbl_users_roles`.role_id=2 )";
		return super.executeNativeSql(sql);
	}
	
	
//	@PersistenceContext
//	protected EntityManager entityManager;
//	
//	protected UserEntity getById(int id) {
//		return entityManager.find(UserEntity.class, id);
//	}
//	
//	@SuppressWarnings("unchecked")
//	public List<UserEntity>findAll(){
//		
//		Table tbl=UserEntity.class.getAnnotation(Table.class);
//		return (List<UserEntity>) entityManager.createNativeQuery("SELECT * FROM"+ tbl.name(),UserEntity.class).getResultList();
//	}
//	
//	@Transactional
//	public UserEntity saveOrUpdate(UserEntity entity) {
//		if(entity.getId() == null ||entity.getId()<=0) {
//			entityManager.persist(entity);
//			return entity;
//		}else {
//			return entityManager.merge(entity);
//		}
//		
//	}
//	public void delete(UserEntity entity) {
//		entityManager.remove(entity);
//	}
//	public void deleteById(int id) {
//		UserEntity entity=this.getById(id);
//		delete(entity);
//	}
//	
//	@SuppressWarnings("unchecked")
//	public List<UserEntity> executeNativeSql(String sql){
//		try {
//			Query query=entityManager.createNativeQuery(sql,UserEntity.class);
//			return query.getResultList();
//		}catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			return new ArrayList<UserEntity>();
//		}
//	}
//	
////	@SuppressWarnings("unchecked")
////	public List<UserEntity> findNearUser() {
////		Table tbl = UserEntity.class.getAnnotation(Table.class);
////		return (List<UserEntity>) entityManager.createNativeQuery("SELECT * FROM " + tbl.name()+" order by created_date desc limit 5", UserEntity.class).getResultList();
////	}
//	@SuppressWarnings("unchecked")
//	public List<UserEntity>findNearUser(){
//		
//		Table tbl=UserEntity.class.getAnnotation(Table.class);
//		return (List<UserEntity>) entityManager.createNativeQuery("SELECT * FROM "+ tbl.name()+" order by created_date desc limit 5",UserEntity.class).getResultList();
//	}
//	@SuppressWarnings("unchecked")
//	public List<UserEntity>findActiveUser(){
//		
//		Table tbl=UserEntity.class.getAnnotation(Table.class);
//		return (List<UserEntity>) entityManager.createNativeQuery("SELECT * FROM "+ tbl.name()+" where status =1",UserEntity.class).getResultList();
//	}
	
}
