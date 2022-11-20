package com.home.shop3.entities.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.home.shop3.entities.BaseEntity;

@Entity
@Table(name="tbl_contact")
public class ContactEntity extends BaseEntity {
	@Column(name="name" )
	private String name;
	
	@Column(name="email")
	private String email;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="note")
	private String note;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	
}
