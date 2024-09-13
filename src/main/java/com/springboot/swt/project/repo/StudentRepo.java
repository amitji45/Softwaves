package com.springboot.swt.project.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.Student;
import com.springboot.swt.project.entity.User;

public interface StudentRepo extends JpaRepository<Student, Integer> {
	Student findByUserAndBatch(User user,Batch batch);
	Student findByRollNoAndBatch(String rollNo,Batch batch);
	Student findByUser(User user);
//	Student findByUserAndBatch(User user,Batch batch);
	
	 
	 Student findByUserId(User user);

	 List<Student> findByBatch(Batch batchId);
//	 List<Student> findBy(Batch batchId);
	 
	  
	
}
