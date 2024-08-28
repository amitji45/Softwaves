package com.springboot.swt.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.swt.project.UserServiceImpl.BatchServiceImpl;
import com.springboot.swt.project.UserServiceImpl.UserServiceImpl;
import com.springboot.swt.project.entity.Batch;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	private UserServiceImpl userserviceimpl;

	@Autowired
	private BatchServiceImpl batchservicesimpl;

	@RequestMapping("/dashboard")
	public String getAdminDashboard() {
		return "newbatch";
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

	@ResponseBody
	@RequestMapping("/newbatch")
	public ModelAndView newBatch(@ModelAttribute("batch") Batch batch, BindingResult bindingResult) {
		System.out.println(batch);
		Batch temp = batchservicesimpl.newBatch(batch);
		ModelAndView modal = new ModelAndView();
		if (temp == null) {
			modal.addObject("error", "Something Went Wrong try Again Later");
			modal.setViewName("redirect:dashboard");
			return modal;
		}
		modal.setViewName("redirect:dashboard");
		return modal;
	}

}
