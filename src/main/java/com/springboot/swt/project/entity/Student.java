package com.springboot.swt.project.entity;

import java.util.ArrayList;

import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "studentTable")

public class Student {
	
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

	 @ElementCollection
	 private ArrayList<Integer> marks;
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


	public String getRollNo() {
		return rollNo;
	}


	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}


	public ArrayList<Integer> getMarks() {
		return marks;
	}


	public void setMarks(ArrayList<Integer> marks) {
		this.marks = marks;
	} 
	 
	}

