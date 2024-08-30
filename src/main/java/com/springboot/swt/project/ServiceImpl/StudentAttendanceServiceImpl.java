package com.springboot.swt.project.ServiceImpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.springboot.swt.project.Service.StudentAttendanceService;
import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.StudentAttendance;
import com.springboot.swt.project.repo.BatchRepo;
import com.springboot.swt.project.repo.StudentAttendanceRepo;

public class StudentAttendanceServiceImpl implements StudentAttendanceService{
	
	@Autowired
	StudentAttendanceRepo studentAttendanceRepo;
	
	@Autowired
	BatchRepo batchRepo;
	
	@Override
	public StudentAttendance markAttendance(String rollNo,String batchId) {
		
		Batch batch=(batchRepo.findById(batchId)).get();
		StudentAttendance student= studentAttendanceRepo.findByRollNoAndBatch(rollNo,batch);
		
		if(student==null)return null;
		student.setAttendanceCount(student.getAttendanceCount()+1);
		studentAttendanceRepo.save(student);

		return student;
	}

}
