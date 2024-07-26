package com.springboot.swt.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.swt.project.entity.User;

public interface UserRepo extends JpaRepository<User,String >{
	
	User findByContactNoOrEmail(String contactNo ,String email);
	User findByEmailAndPassword(String email,String password);
	User findByContactNoAndPassword(String contactNo,String password);
}
