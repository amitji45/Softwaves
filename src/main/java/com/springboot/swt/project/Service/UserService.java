package com.springboot.swt.project.Service;

import java.util.List;
import java.util.Map;

import com.springboot.swt.project.entity.Student;
import com.springboot.swt.project.entity.User;

public interface UserService {
	Map<String, Object> register(User user);

	User login(String email, String password);

	String encode(String s);

	String decode(String s);

	boolean finder(User user);

	public void otpSend(String email, String purpose);

	public User resetPassword(String email, String password);

	String allowOrBlockUserByID(String id, String allowed);

	public List<User> getNotAllowedUsers();

	public List<Integer> getMarksList(String id);

	public String enrollstudent(String batchId, User user);

	public Student markAttendancepresent(String rollNo, String batchId);

	public Student markAttendanceAbsent(String rollNo, String batchId);

	public List<Student> findStudentBatch(User user);

	public List<Student> getAllStudent(String name);

	String allowOrBlockVolunteerByID(String id, String allowed);

	Map<String, Object> tempRegister(User user);

	Object getUser(String email, String purpose);

	public List<Integer> getMarksListCompletedBatch(String studId);

}
