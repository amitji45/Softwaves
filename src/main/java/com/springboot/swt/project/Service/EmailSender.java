package com.springboot.swt.project.Service;

public interface EmailSender {

	String sendEmail(String to, String subject, String massage, String purpose);
}
