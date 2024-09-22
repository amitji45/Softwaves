package com.springboot.swt.project.Service;

import java.util.List;

import com.springboot.swt.project.entity.Student;

public interface StudentService {

	Student markAttendance(String rollNo, String batchId);
	List<Student> findByBatch(String batchId);
	List<Student> findAllStudent(String name);
	Student setMarks(String rollNo, String batchId, Integer marks);
	
	
}
