package com.springboot.swt.project.entity;



import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="usertable")
public class User {

	@Id
	private String contactNo;
	@Column(nullable = false)
	private String name;
	@Column(nullable = false , unique=true)
	private String email;
	
	@Column(nullable = false)
	private String batch;
	@Column(nullable = false)
	private String role;
	
	@Column(nullable = false)
	private String password;
	

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}


	public User(String name, String email, String contactNo, String batch, String role, String password) {
		super();
		this.name = name;
		this.email = email;
		this.contactNo = contactNo;
		this.batch = batch;
		this.role = role;
		this.password = password;
	}


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


	public String getContactNo() {
		return contactNo;
	}


	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}


	public String getBatch() {
		return batch;
	}


	public void setBatch(String batch) {
		this.batch = batch;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "User [contactNo=" + contactNo + ", name=" + name + ", email=" + email + ", batch=" + batch + ", role="
				+ role + ", password=" + password + "]";
	}

	
}
