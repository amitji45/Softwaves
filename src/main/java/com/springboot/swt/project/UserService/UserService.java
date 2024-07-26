package com.springboot.swt.project.UserService;

import com.springboot.swt.project.entity.User;

public interface UserService {
	User register(User user);
	User login(User user);
	String encode(String s);

	String decode(String s);

	boolean finder(User user);
}
