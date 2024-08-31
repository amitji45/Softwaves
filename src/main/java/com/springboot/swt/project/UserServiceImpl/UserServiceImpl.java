package com.springboot.swt.project.UserServiceImpl;

import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
			tempEmail.setContactNo(decode(tempEmail.getContactNo()));
			return tempEmail;
		}
		return null;
		
	}


	@Override
	public String[] validation(User user) {

//		String [] patternString = {"^(\\w+[@](gmail|yahoo)\\.(com|in))$" , "^(([+]91)?[6-9]\\d{9})$" ,"^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"};
//		String [] matcherString = {user.getEmail() , user.getContactNo() , user.getPassword()};
//		int count =0;
//		for (int i=0;i<patternString.length;i++)
//		{
//			Pattern pattern =Pattern.compile(patternString[i]);
//			Matcher matcher=pattern.matcher(matcherString[i]);
//			if (matcher.matches()) count++;
//		}
		
//		
		Pattern emailValid=Pattern.compile("^(\\w+[@](gmail|yahoo)\\.(com|in))$");
		 Matcher emailMatcher=emailValid.matcher(user.getEmail());
		 if (!emailMatcher.matches())return new String[]{"false" , "email is not valid " };
		 
		 Pattern phoneValid=Pattern.compile("^(([+]91)?[6-9]\\d{9})$");
		 Matcher phoneMatcher=phoneValid.matcher(user.getContactNo());
		 if (!phoneMatcher.matches())return new String[]{"false", "phone no is invalid " };
		 
		 
		 Pattern passValid=Pattern.compile("^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$");
		 Matcher passMatcher=passValid.matcher(user.getPassword());
		 if (!passMatcher.matches())return new String[]{"false" , "password is invalid " };
		 
		 
//		return passMatcher.matches() && emailMatcher.matches() && phoneMatcher.matches() ;

		return new String[]{"true" , "sucess"};
	}
	
	
}
