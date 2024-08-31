package com.springboot.swt.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.swt.project.UserServiceImpl.UserServiceImpl;
import com.springboot.swt.project.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@Controller	
public class UserController {

	@Autowired
	private UserServiceImpl userserviceimpl;

	//Login Controller
	@PostMapping("/login")
	public ModelAndView login(HttpServletRequest request, @RequestParam String email, String password) {
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		System.out.println(user);
		ModelAndView modal = new ModelAndView();
		User temp = userserviceimpl.login(user);
		if (temp == null) {
			modal.addObject("error", "Incorrect Email or password ");
			modal.setViewName("redirect:/swt/login");
			return modal;
		}
		HttpSession session = request.getSession();
		session.setAttribute("user", temp);
		modal.setViewName("redirect:dashboard");
		return modal;
	}

	@RequestMapping("/dashboard")
	public String getDashBoard() {
		return "dashboard";
	}

	@RequestMapping("/regis")
	public ModelAndView registration(@ModelAttribute("user") User user, BindingResult bindingResult) {
		user.setRole("Student");
//		validation 
		String [] out =userserviceimpl.validation(user);
		ModelAndView modalValid = new ModelAndView();
		if(out[0].equals("false")) 
		{
			modalValid.addObject("error", out[1]);
			modalValid.setViewName("redirect:/swt/regis");
			return modalValid;
		}
		
		User temp = userserviceimpl.register(user);
		ModelAndView modal = new ModelAndView();
		if (temp == null) {
			modal.addObject("error", "Something Went Wrong try Again Later");
			modal.setViewName("redirect:/swt/regis");
			return modal;
		}
		modal.setViewName("redirect:/swt/login");
		return modal;
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/swt/";
	}
	
	@RequestMapping("/dashboard/attendance")
	public String getAttendance() {
		return "attendance";
	}
}
