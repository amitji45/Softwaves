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
import com.springboot.swt.project.ServiceImpl.UserServiceImpl;
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
		return "admindashboard";
	}

	@RequestMapping("/allBatches")
	public String createBatchPage(Model model) {
		model.addAttribute("batches", batchservicesimpl.getAllBatches());
		return "newbatch";
	}
	
	@RequestMapping("/startbatch")
	public String startbatch(@RequestParam("id") String batchId) {
		 batchservicesimpl.startBatchByID(batchId);
		return "redirect:allBatches";
	}
	
	@RequestMapping("/endbatch")
	public String endbatch(@RequestParam("id") String batchId) {
		 batchservicesimpl.endBatchByID(batchId);
		return "redirect:allBatches";
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
	public ResponseEntity<String> newBatch(@RequestParam String name) {
		Batch batch = new Batch();
		batch.setBatchTopic(name);
		Batch temp = batchservicesimpl.newBatch(batch);
		if (temp == null) {
			return new ResponseEntity<>("Something Went Wrong",HttpStatus.FORBIDDEN);
		}
		return new ResponseEntity<>("Batch Created SuccessFully ", HttpStatus.OK);
	}
	

}
