package com.springboot.swt.project.entity;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "studentTable")

public class Student {

	@Override
	public String toString() {
		return "Student [Id=" + Id + ", batch=" + batch + ", user=" + user + ", rollNo=" + rollNo + ", attendanceCount="
				+ attendanceCount + ", marks=" + marks + ", absent=" + absent + "]";
	}

	@GeneratedValue(strategy = GenerationType.SEQUENCE)
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

	@CollectionTable
	@ElementCollection
	private List<Integer> marks;

	@Autowired
	@ElementCollection
	public Set<String> absent;

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public Set<String> getAbsent() {
		return absent;
	}

	public void setAbsent(Set<String> absent) {
		this.absent = absent;
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

	public String getRollNo() {
		return rollNo;
	}

	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}

	public int getAttendanceCount() {
		return attendanceCount;
	}

	public void setAttendanceCount(int attendanceCount) {
		this.attendanceCount = attendanceCount;
	}

	public List<Integer> getMarks() {
		return marks;
	}

	public void setMarks(List<Integer> marks) {
		this.marks = marks;
	}

}
