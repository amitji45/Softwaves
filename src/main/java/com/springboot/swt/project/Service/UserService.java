package com.springboot.swt.project.Service;

import java.util.List;

import com.springboot.swt.project.entity.User;

public interface UserService {
	User register(User user);
	User login(String email , String password);
	String encode(String s);

	String decode(String s);

	boolean finder(User user);
	
	String allowOrBlockUserByID(String id , String allowed);
	
	public List<User> getNotAllowedUsers();
}
