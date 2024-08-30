package com.springboot.swt.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.StudentAttendance;
import com.springboot.swt.project.entity.User;

public interface StudentAttendanceRepo extends JpaRepository<StudentAttendance, Integer> {
	StudentAttendance findByUserAndBatch(User user,Batch batch);
	StudentAttendance findByRollNoAndBatch
	
}
