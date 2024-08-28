package com.springboot.swt.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springboot.swt.project.UserServiceImpl.UserServiceImpl;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	private UserServiceImpl userserviceimpl;

	@RequestMapping("/dashboard")
	public String getAdminDashboard() {
		return "admindashboard";
	}

	@RequestMapping("/createBatch")
	public String createBatchPage() {
		return "createBatch";
	}

	@RequestMapping("/approval")
	public String getNotAllowedUsers(Model model) {
		model.addAttribute("data", userserviceimpl.getNotAllowedUsers());
		
		return "approval";
	}

	@ResponseBody
	@RequestMapping("/approval/allow")
	public String allowByID(@RequestParam("id") String id) {
		userserviceimpl.allowOrBlockUserByID(id, "Allowed");
		return "Allowed";
	}

	@ResponseBody
	@RequestMapping("/approval/block")
	public String blockByID(@RequestParam("id") String id) {
		userserviceimpl.allowOrBlockUserByID(id, "Blocked");
		return "Blocked";
	}
	
	
}
