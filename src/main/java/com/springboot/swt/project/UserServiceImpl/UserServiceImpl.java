package com.springboot.swt.project.UserServiceImpl;

import java.time.LocalDate;
import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.swt.project.UserService.UserService;
import com.springboot.swt.project.entity.User;
import com.springboot.swt.project.repo.UserRepo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepo userrepo;

	@Override
	public User register(User user) {
		user.setId(generateUserId(user));
		user.setPassword(encode(user.getPassword()));
		user.setContactNo(encode(user.getContactNo()));

		if (finder(user))
			return null;
		userrepo.save(user);
		user.setContactNo(decode(user.getContactNo()));
		user.setPassword(decode(user.getPassword()));
		return user;
	}

	private String generateUserId(User user) {
		StringBuilder id = new StringBuilder();
		LocalDate local = LocalDate.now();
		id = id.append(("" + local.getYear()).substring(2));
		id = id.append("swt");
		id = id.append(user.getContactNo().substring(0, 3));
		Random rand = new Random();
		id = id.append(String.format("%04d", rand.nextInt(10000)));
		return id.toString();
	}

	@Override
	public String encode(String s) {
		return Base64.getEncoder().encodeToString(s.getBytes());
	}

	@Override
	public String decode(String s) {
		return new String(Base64.getDecoder().decode(s));
	}

	@Override
	public boolean finder(User user) {
		return userrepo.findByContactNoOrEmail(user.getContactNo(), user.getEmail()) != null;
	}

	@Override
	public User login(String email, String password) {
		User tempEmail = userrepo.findByEmailAndPassword(email, encode(password));
		if (tempEmail != null) {
			tempEmail.setContactNo(decode(tempEmail.getContactNo()));
			return tempEmail;
		}
		return null;
	}

	@Override
	public String allowOrBlockUserByID(String id, String allowed) {
		Optional<User> optional = userrepo.findById(id);
		User user  = optional.get();
        user.setAllowed(allowed);
        userrepo.save(user);
        return allowed;
	}

	@Override
	public List<User> getNotAllowedUsers() {
		return userrepo.findByAllowed("Not Allowed").stream().map(user -> {
			user.setContactNo(decode(user.getContactNo()));
			return user;
		}).toList();
	}

}
