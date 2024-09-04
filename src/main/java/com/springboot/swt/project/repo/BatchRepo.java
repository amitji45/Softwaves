package com.springboot.swt.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.User;

public interface BatchRepo extends JpaRepository<Batch,String >
{
	
}
