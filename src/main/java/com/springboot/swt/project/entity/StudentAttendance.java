package com.springboot.swt.project.entity;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "studentTable")

public class StudentAttendance {
   
	 @Id
	 private Integer Id;
	 
	 @ManyToOne
	 private Batch batch;

	 @ManyToOne
	 private User user;
	 
	 @Column
	 private String rollNo;
	 
	 @Column
	 private int attendanceCount;


	public Integer getId() {
		return Id;
	}


	public void setId(Integer id) {
		Id = id;
	}


	public Batch getBatch() {
		return batch;
	}


	public void setBatch(Batch batch) {
		this.batch = batch;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public int getAttendanceCount() {
		return attendanceCount;
	}


	public void setAttendanceCount(int attendanceCount) {
		this.attendanceCount = attendanceCount;
	} 
	 
	}

