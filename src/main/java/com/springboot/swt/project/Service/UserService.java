package com.springboot.swt.project.Service;

import java.util.List;

import com.springboot.swt.project.entity.Student;
import com.springboot.swt.project.entity.User;

public interface UserService {
	User register(User user);
	User login(String email , String password);
	String encode(String s);

	String decode(String s);

	boolean finder(User user);
	public void otpSend(String email);
	public User resetPassword(String email , String password);

	String allowOrBlockUserByID(String id, String allowed);

	public List<User> getNotAllowedUsers();

	public List<Integer> getMarksList(String id);

	public String enrollstudent(String batchId, User user);
	public Student markAttendancepresent(String rollNo,String batchId);
	public Student markAttendanceAbsent(String rollNo,String batchId);
	public List<Student> findStudentBatch(User user);
	
	
}
