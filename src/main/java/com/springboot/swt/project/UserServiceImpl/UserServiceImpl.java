package com.springboot.swt.project.UserServiceImpl;

import java.util.Base64;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.swt.project.UserService.UserService;
import com.springboot.swt.project.entity.User;
import com.springboot.swt.project.repo.UserRepo;

@Service
public class UserServiceImpl implements UserService{

	@Autowired	
	private UserRepo userrepo;
	@Override
	public User register(User user) {
		
		user.setPassword(encode(user.getPassword()));
		user.setContactNo(encode(user.getContactNo()));
		if(finder(user))return null;
		userrepo.save(user);
		user.setContactNo(decode(user.getContactNo()));
		user.setPassword(decode(user.getPassword()));
		HashSet st=new HashSet();
		st.add(user);
		return user;
	}


	@Override
	public String encode(String s) {
		// TODO Auto-generated method stub
		return Base64.getEncoder().encodeToString(s.getBytes());
	}

	@Override
	public String decode(String s) {
		// TODO Auto-generated method stub
		return new String(Base64.getDecoder().decode(s));
	}

	@Override
	public boolean finder(User user) {
		
		 return null!=userrepo.findByContactNoOrEmail(user.getContactNo(), user.getEmail());	
	}


	@Override
	public User login(User user) {
		
		User tempEmail= userrepo.findByEmailAndPassword(user.getEmail(), encode(user.getPassword()));
		
		if(tempEmail!=null)
		{
			return user;
		}
		return null;
		
	}
	
	
}
