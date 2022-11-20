package com.home.shop3.entities.admin;

import java.util.HashSet;  
import java.util.Set;

//import javax.annotation.Generated;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.home.shop3.entities.BaseEntity;

@Entity
@Table(name="position_table")
public class PositionEmployee extends  BaseEntity {
	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name="id",nullable=false)
//	private Integer id;
	
	
	@Column(name="name",nullable=false)
	private String name;
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy = "position")
	private Set<EmployeeEntity> employees=new HashSet<EmployeeEntity>();
	
	public void addPosition(EmployeeEntity employee) {
		this.employees.add(employee);
//		employees.set(this);
	}
//
	public void deleteProduct(EmployeeEntity product) {
		this.employees.remove(product);
//		product.setCategories(null);
	}
	
	public Set<EmployeeEntity> getEmployees() {
		return employees;
	}

	public void setEmployees(Set<EmployeeEntity> employees) {
		this.employees = employees;
	}


	
	
//	public Integer getId() {
//		return id;
//	}
//
//	
//	public void setId(Integer id) {
//		this.id = id;
//	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
