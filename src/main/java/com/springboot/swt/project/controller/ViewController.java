package com.springboot.swt.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/swt")
public class ViewController {

	@RequestMapping( {"/" , "/home" , "/index"} )
	public String getLandingPage()
	{
		return "index";
	}
	
}
