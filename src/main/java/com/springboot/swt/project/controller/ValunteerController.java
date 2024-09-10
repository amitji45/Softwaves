package com.springboot.swt.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.swt.project.ServiceImpl.BatchServiceImpl;
import com.springboot.swt.project.ServiceImpl.StudentAttendanceServiceImpl;
import com.springboot.swt.project.ServiceImpl.UserServiceImpl;
import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.Student;

@Controller
@RequestMapping("/valunteer")
public class ValunteerController {

	@Autowired
	BatchServiceImpl batchservice;
	@Autowired
	UserServiceImpl userserviceimpl;

	@Autowired
	StudentAttendanceServiceImpl StudentAttendanceServiceImpl;

	@RequestMapping("/findActivebatches")
	public ResponseEntity findActivebatches() {
		List<Batch> batchlist = batchservice.findByCurrentStatus("Active");

		return new ResponseEntity(batchlist, HttpStatus.OK);
	}

	@RequestMapping("/findallstudent")
	public String findallstudent(@RequestParam("batchId") String batchId, Model model) {
		List<Student> studentlist = StudentAttendanceServiceImpl.findByBatch(batchId);
		model.addAttribute("studentlist", studentlist);
		return "userattendence";

	}
	
	@RequestMapping("/userattendence")
	public String userattendence() {
		return "userattendence";
		
	}

	@RequestMapping("/studentattendence/present")
	public String markAttendancepresent(@RequestParam("rollNo") String rollNo,@RequestParam("batchId") String batchId) {
			Student s=userserviceimpl.markAttendancepresent(rollNo, batchId);
			System.out.println("ram ji..."+s);
		return "userattendence";
	}
	@RequestMapping("/studentattendence/absent")
	public String markAttendanceAbsent(@RequestParam("rollNo") String rollNo,@RequestParam("batchId") String batchId) {
		Student s=userserviceimpl.markAttendanceAbsent(rollNo, batchId);
		System.out.println("ram ji..."+s);
		return "userattendence";
	}
}
