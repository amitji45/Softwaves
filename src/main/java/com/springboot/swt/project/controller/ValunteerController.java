package com.springboot.swt.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.swt.project.ServiceImpl.BatchServiceImpl;
import com.springboot.swt.project.ServiceImpl.StudentAttendanceServiceImpl;
import com.springboot.swt.project.ServiceImpl.UserServiceImpl;
import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.Student;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
	public ResponseEntity findActivebatches(Model model,HttpServletRequest  session) {
		List<Batch> batchlist = batchservice.findByCurrentStatus("Active");
		if (batchlist.size() == 0) {
			model.addAttribute("activebatch", batchlist);
			return null;
		}
		return new ResponseEntity(batchlist, HttpStatus.OK);
	}
	@RequestMapping("/findallstudent")
	public String findallstudent(@RequestParam("batchId") String batchId, Model model,HttpServletRequest  session) {
		List<Student> studentlist = StudentAttendanceServiceImpl.findByBatch(batchId);
//		List<Student> absentlist = StudentAttendanceServiceImpl.findByBatch(batchId);
		if (studentlist.size() != 0)
			model.addAttribute("studentlist", studentlist);
		// model.addAttribute("absentlist", absentlist);
		return "userattendance";
	}
	@RequestMapping("/userattendance")
	public String userattendance(HttpServletRequest  session) {
		
		return "userattendance";
	}
	@RequestMapping("/studentattendance/present")
	public String markAttendancepresent(@RequestParam("rollNo") String rollNo,
			@RequestParam("batchId") String batchId, HttpServletRequest  session) {
		userserviceimpl.markAttendancepresent(rollNo, batchId);
		return "userattendance";
	}
	@RequestMapping("/studentattendance/absent")
	public String markAttendanceAbsent(@RequestParam("rollNo") String rollNo, @RequestParam("batchId") String batchId,HttpServletRequest  session) {
		userserviceimpl.markAttendanceAbsent(rollNo, batchId);
		return "userattendance";
	}
	@RequestMapping("/volunteerMarks")
	public String volunteerMarks(HttpServletRequest request) {
		List<Batch> activebatches=batchservice.findByCurrentStatus("Active");
		HttpSession session=request.getSession();
 		session.setAttribute("activebatch",activebatches) ;
		return "volunteerMarks";
	}
	@RequestMapping("/setmarks")
	public void setStudentMarks(@RequestParam String rollNo, String batchId,  String marks)
	{	
		StudentAttendanceServiceImpl.setMarks(rollNo, batchId, Integer.parseInt( marks));
	}
}
