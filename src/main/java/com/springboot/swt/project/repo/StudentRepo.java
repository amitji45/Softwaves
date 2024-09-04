package com.springboot.swt.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.Student;
import com.springboot.swt.project.entity.User;

public interface StudentRepo extends JpaRepository<Student, Integer> {
	Student findByUserAndBatch(User user,Batch batch);
	Student findByRollNoAndBatch(String rollNo,Batch batch);
	Student findByUser(User user);
}
