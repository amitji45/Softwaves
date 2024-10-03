package com.springboot.swt.project.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.swt.project.entity.User;

public interface UserRepo extends JpaRepository<User, String> {

    User findByContactNoOrEmail(String contactNo, String email);

    User findByEmailAndPassword(String email, String password);

    User findByContactNoAndPassword(String contactNo, String password);

    List<User> findByAllowed(String allowed);

    List<User> findByRole(String role);
}
