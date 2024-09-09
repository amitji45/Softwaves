package com.springboot.swt.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.swt.project.ServiceImpl.BatchServiceImpl;
import com.springboot.swt.project.ServiceImpl.UserServiceImpl;
import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private UserServiceImpl userserviceimpl;
	@Autowired
	private BatchServiceImpl batchservicesimpl;

	// Login Controller
	@PostMapping("/login")
	public ModelAndView login(HttpServletRequest request, @RequestParam String email, String password) {
		ModelAndView modal = new ModelAndView();
		User temp = userserviceimpl.login(email, password);
		if (temp != null && temp.getAllowed().equals("Allowed")) {
			HttpSession session = request.getSession();
			session.setAttribute("user", temp);
			modal.setViewName("redirect:dashboard");
			return modal;
		}

		if (temp == null) {
			modal.addObject("error", "Incorrect Email or password ");
		} else if (temp.getAllowed().equals("Not Allowed")) {
			modal.addObject("error", "Wait For Approval");
		} else {
			modal.addObject("error", "Account Blocked Contact Admin Portal");
		}
		modal.setViewName("redirect:/swt/login");
		return modal;
	}

	@RequestMapping("/dashboard")
	public String getDashBoard() {
		return "dashboard";
	}

	@RequestMapping("/regis")
	public ModelAndView registration(@ModelAttribute("user") User user, BindingResult bindingResult) {
		user.setRole("Student");
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

	@RequestMapping("/marks")
	public ModelAndView getStudentMarks(@RequestParam String id) {

		List<Integer> marksList = userserviceimpl.getMarksList(id);
		System.out.println(marksList);
		return new ModelAndView("redirect:/views/studentmarks.jsp", "marksList", marksList);
	}

	@RequestMapping("/allbatches")
	public ResponseEntity createBatchPage(HttpServletRequest request, Model model) {
		List<Batch> batches = batchservicesimpl.getAllBatches();
		return new ResponseEntity<>(batches, HttpStatus.OK);
	}
	@RequestMapping("/enrollstudent")
	public  ResponseEntity enrollstudent(@RequestParam String batchId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User session1 = (User) session.getAttribute("user");
		System.out.println("enrollstudent controller....." + session1 + "    " + batchId);
		if (session1 != null)
		{
			String cuurentstatus=(String)  userserviceimpl.enrollstudent(batchId, session1);
			return  new ResponseEntity<>(cuurentstatus, HttpStatus.OK);
		}
		return new ResponseEntity<>("error not enroll..",HttpStatus.FORBIDDEN);
	}

}
