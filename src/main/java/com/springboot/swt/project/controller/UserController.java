package com.springboot.swt.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.swt.project.UserServiceImpl.UserServiceImpl;
import com.springboot.swt.project.entity.User;

@RequestMapping("/user")
@RestController
public class UserController {

	@Autowired
	private UserServiceImpl userserviceimpl;
	
	@RequestMapping("/login")
	public ResponseEntity<User> login(@RequestBody User user)
	{
		User temp =userserviceimpl.login(user);
		if(temp ==null)return new ResponseEntity<>(HttpStatus.NOT_FOUND);
				return new ResponseEntity<>(temp,HttpStatus.OK); 
	}
	@RequestMapping("/regis")
	public ResponseEntity<User> registration(@RequestBody User user)
	{
		User temp =userserviceimpl.register(user);
		if(temp ==null)return new ResponseEntity<>(HttpStatus.CONFLICT);
				return new ResponseEntity<>(temp,HttpStatus.OK); 
	}
}
