package com.springboot.swt.project.entity;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "batch")
public class Batch {

	@Id
	private String batchId;

	@Column(nullable = false)
	private String batchTopic;

	@Column
	private Date startDate;

	@Column
	private Date endDate;

	@Column(nullable = false)
	private String currentStatus = "Enroll";

	@Column
	private int numberOfStudents;

	public String getBatchId() {
		return batchId;
	}

	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}

	public String getBatchTopic() {
		return batchTopic;
	}

	public void setBatchTopic(String batchTopic) {
		this.batchTopic = batchTopic;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getCurrentStatus() {
		return currentStatus;
	}

	public void setCurrentStatus(String currentStatus) {
		this.currentStatus = currentStatus;
	}

	public int getNumberOfStudents() {
		return numberOfStudents;
	}

	public void setNumberOfStudents(int numberOfStudents) {
		this.numberOfStudents = numberOfStudents;
	}

	@Override
	public String toString() {
		return "Batch [batchId=" + batchId + ", batchTopic=" + batchTopic + ", startDate=" + startDate + ", endDate="
				+ endDate + ", currentStatus=" + currentStatus + ", numberOfStudents=" + numberOfStudents + "]";
	}

}
