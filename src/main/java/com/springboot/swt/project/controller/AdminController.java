package com.springboot.swt.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
 
	 @RequestMapping("/dashboard")
	 public String getAdminDashboard()
	 {
		 return "admindashboard";
	 }
}
