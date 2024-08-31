package com.springboot.swt.project.UserService;

public interface EmailSender {
	String sendEmail(String to,String subject,String massage);
}
