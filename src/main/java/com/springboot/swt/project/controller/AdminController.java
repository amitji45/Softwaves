package com.springboot.swt.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springboot.swt.project.ServiceImpl.BatchServiceImpl;
import com.springboot.swt.project.ServiceImpl.EmailSenderImpl;
import com.springboot.swt.project.ServiceImpl.StudentAttendanceServiceImpl;
import com.springboot.swt.project.ServiceImpl.UserServiceImpl;
import com.springboot.swt.project.entity.Batch;

import jakarta.servlet.http.HttpServletRequest;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	private UserServiceImpl userserviceimpl;
	
	@Autowired
	private StudentAttendanceServiceImpl studentAttendanceServiceImpl;
	
	@Autowired
	private BatchServiceImpl batchservicesimpl;

	@Autowired
	EmailSenderImpl emailsenderimp;

	
	
	@RequestMapping("/dashboard")
	public String getAdminDashboard(HttpServletRequest request) {
		if(request.getSession().getAttribute("admin")==null) return "redirect:/swt/login";
		return "admindashboard";
	}

	@RequestMapping("/allBatches")
	public String createBatchPage(Model model ,HttpServletRequest request) {
		if(request.getSession().getAttribute("admin")==null) return "redirect:/swt/login";
		model.addAttribute("batches", batchservicesimpl.getAllBatches());
		return "newbatch";
	}

	@RequestMapping("/startbatch")
	public String startbatch(@RequestParam("id") String batchId,HttpServletRequest request) {
		if(request.getSession().getAttribute("admin")==null) return "redirect:/swt/login";
		batchservicesimpl.startBatchByID(batchId);
		return "redirect:allBatches";
	}

	@RequestMapping("/endbatch")
	public String endbatch(@RequestParam("id") String batchId,HttpServletRequest request) {
		if(request.getSession().getAttribute("admin")==null) return "redirect:/swt/login";
		batchservicesimpl.endBatchByID(batchId);
		return "redirect:allBatches";
	}

	@RequestMapping("/approval")
	public String getNotAllowedUsers(Model model,HttpServletRequest request) {
		if(request.getSession().getAttribute("admin")==null) return "redirect:/swt/login";
		model.addAttribute("data", userserviceimpl.getNotAllowedUsers());
		return "approval";
	}

	@ResponseBody
	@RequestMapping("/approval/allow")
	public String allowByID(@RequestParam("id") String id,HttpServletRequest request) {
		if(request.getSession().getAttribute("admin")==null) return "redirect:/swt/login";
		userserviceimpl.allowOrBlockUserByID(id, "Allowed");
		return "Allowed";
	}
	@ResponseBody
	@RequestMapping("/approval/block")
	public String blockByID(@RequestParam("id") String id,HttpServletRequest request) {
		if(request.getSession().getAttribute("admin")==null) return "redirect:/swt/login";
		userserviceimpl.allowOrBlockUserByID(id, "Blocked");
		return "Blocked";
	}
	@ResponseBody
	@RequestMapping("/newbatch")
	public ResponseEntity<String> newBatch(@RequestParam String name,HttpServletRequest request) {
		
		Batch batch = new Batch();
		batch.setBatchTopic(name);
		Batch temp = batchservicesimpl.newBatch(batch);
		if (temp == null) {
 
			return new ResponseEntity<>("Something Went Wrong", HttpStatus.FORBIDDEN);
		}
		return new ResponseEntity<>("Batch Created SuccessFully ", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping("/sendemail")
	public ResponseEntity<String> sendEmail(@RequestParam String to, @RequestParam String subject,
			@RequestParam String massage) {
		return new ResponseEntity<>(emailsenderimp.sendEmail(to, subject, massage), HttpStatus.OK);
	}
	
	@RequestMapping("/VolunteerApproval")
	public String VApproval (Model model,HttpServletRequest request) {
		if(request.getSession().getAttribute("admin")==null) return "redirect:/swt/login";
//		model.addAttribute("data", studentAttendanceServiceImpl.findAllStudent());
		return "VolunteerApproval";
	}
	@ResponseBody
	@RequestMapping("/VolunteerApproval/allow")
	public String approveVolunteerByID(@RequestParam("id") String id,HttpServletRequest request) {
		if(request.getSession().getAttribute("admin")==null) return "redirect:/swt/login";
		userserviceimpl.allowOrBlockVolunteerByID(id, "Volunteer");
		return "Volunteer";
	}
	@ResponseBody
	@RequestMapping("/VolunteerApproval/block")
	public String blockVolunteerByID(@RequestParam("id") String id,HttpServletRequest request) {
		if(request.getSession().getAttribute("admin")==null) return "redirect:/swt/login";
		userserviceimpl.allowOrBlockVolunteerByID(id, "Student");
		return "Student";
	}

}