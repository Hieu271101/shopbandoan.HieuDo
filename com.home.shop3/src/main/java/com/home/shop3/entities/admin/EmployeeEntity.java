package com.home.shop3.entities.admin;

import java.math.BigDecimal; 
import java.sql.Date;  

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
import javax.persistence.Table;

import com.home.shop3.entities.BaseEntity;

@Entity
@Table(name="tbl_employee")
public class EmployeeEntity extends BaseEntity{
	
	@Column(name="name",length = 50)
	private String name;
	@Column(name="email")
	private String email;
	@Column(name="phone",length = 11)
	private String phone;
	@Column(name="dob")
	private Date dob;
	@Column(name="address")
	private String address;
	@Column(name="citizen_id",length = 12)
	private String citizenId;	
	@Column(name="gender")
	private String gender;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "position_id")
	private PositionEmployee position;
	
	
	@Column(name = "avatar",length = 200)
	private String avatar;
	@Column(name="date_c")
	private Date dateC;
	@Column(name="pob",length = 99)
	private String pob;
	@Column(name="place_c",length = 99)
	private String placeC;
	@Column(name="salary")
	private BigDecimal salary;
	@Column(name="salary_minor")
	private double salaryMinor;
	@Column(name="salary_plus")
	private double salaryPlus;
	@Column(name="status_salary")
	private String salaryStatus;
	
	
	@Column(name="degree")
	private String degree;
	
	@Column(name="marital_status")
	private String maritalStatus;
	
	@Column(name="description_condition")
	private String descriptionCondition;
	
	
	
	
	
	
	
	public String getDescriptionCondition() {
		return descriptionCondition;
	}

	public void setDescriptionCondition(String descriptionCondition) {
		this.descriptionCondition = descriptionCondition;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public Date getDateC() {
		return dateC;
	}

	public void setDateC(Date dateC) {
		this.dateC = dateC;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}



	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	

	

	public BigDecimal getSalary() {
		return salary;
	}

	public void setSalary(BigDecimal salary) {
		this.salary = salary;
	}

	public double getSalaryMinor() {
		return salaryMinor;
	}

	public void setSalaryMinor(double salaryMinor) {
		this.salaryMinor = salaryMinor;
	}

	public double getSalaryPlus() {
		return salaryPlus;
	}

	public void setSalaryPlus(double salaryPlus) {
		this.salaryPlus = salaryPlus;
	}

	public String getSalaryStatus() {
		return salaryStatus;
	}

	public void setSalaryStatus(String salaryStatus) {
		this.salaryStatus = salaryStatus;
	}

	public PositionEmployee getPosition() {
		return position;
	}

	public void setPosition(PositionEmployee position) {
		this.position = position;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCitizenId() {
		return citizenId;
	}

	public void setCitizenId(String citizenId) {
		this.citizenId = citizenId;
	}

	

	

	

	

	

	

	public String getPob() {
		return pob;
	}

	public void setPob(String pob) {
		this.pob = pob;
	}



	public String getPlaceC() {
		return placeC;
	}

	public void setPlaceC(String placeC) {
		this.placeC = placeC;
	}



		
	
	
	
	
}
