package com.springboot.swt.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.swt.project.entity.User;

@Controller
@RequestMapping("/swt")
public class ViewController {

	@RequestMapping( {"", "/" , "/home" , "/index"} )
	public String getLandingPage()
	{
		return "index";
	}
	@RequestMapping("/login")
	public String getLoginPage()
	{
		return "login";
	}
	@RequestMapping("/regis")
	public String getRegistrationPage(Model model)
	{
		model.addAttribute("user", new User());
		return "regis";
	}
}
