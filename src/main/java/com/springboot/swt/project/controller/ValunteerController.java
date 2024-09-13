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
	public ResponseEntity findActivebatches(Model model) {
		List<Batch> batchlist = batchservice.findByCurrentStatus("Active");
		if(batchlist.size()==0)
		{
			model.addAttribute("activebatch",batchlist);
			return null;
		}
		return new ResponseEntity(batchlist, HttpStatus.OK);
	}

	@RequestMapping("/findallstudent")
	public String findallstudent(@RequestParam("batchId") String batchId, Model model) {
		List<Student> studentlist = StudentAttendanceServiceImpl.findByBatch(batchId);
//		List<Student> absentlist = StudentAttendanceServiceImpl.findByBatch(batchId);
		if(studentlist.size()!=0)
		model.addAttribute("studentlist", studentlist);
	//	model.addAttribute("absentlist", absentlist);
		return "userattendance";

	}
	
	@RequestMapping("/userattendance")
	public String userattendance() {
		return "userattendance";
		
	}

	@RequestMapping("/studentattendance/present")
	public String markAttendancepresent(@RequestParam("rollNo") String rollNo,@RequestParam("batchId") String batchId) {
			userserviceimpl.markAttendancepresent(rollNo, batchId);
			 
		return "userattendance";
	}
	@RequestMapping("/studentattendance/absent")
	public String markAttendanceAbsent(@RequestParam("rollNo") String rollNo,@RequestParam("batchId") String batchId) {
		userserviceimpl.markAttendanceAbsent(rollNo, batchId); 
		
		return "userattendance";
	}
	
}
