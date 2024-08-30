package com.springboot.swt.project.UserServiceImpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.springboot.swt.project.UserService.StudentAttendanceService;
import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.StudentAttendance;
import com.springboot.swt.project.entity.User;
import com.springboot.swt.project.repo.StudentAttendanceRepo;

public class StudentAttendanceServiceImpl implements StudentAttendanceService{
	
	@Autowired
	StudentAttendanceRepo studentAttendanceRepo;
	@Override
	public StudentAttendance markAttendance(Integer Id) {
		Optional<StudentAttendance> studentTemp= studentAttendanceRepo.findById(Id);
		if(studentTemp.isEmpty())return null;
		
		StudentAttendance student=studentTemp.get();
		
		student.setAttendanceCount(student.getAttendanceCount()+1);
		studentAttendanceRepo.save(student);

		return student;
	}

}
