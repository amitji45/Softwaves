package com.springboot.swt.project.ServiceImpl;
  
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.springboot.swt.project.Service.EmailSender;

@Service
public class EmailSenderImpl implements EmailSender {

	@Override
	public String sendEmail(String to, String subject, String massege) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("coachingswt@gmail.com", "tvhr moki unth tlyg");
			}
		});
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("coachingswt@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(massege);
			Transport.send(message);
			return "Email sent successfully!";
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return "not send Email...";
	}
}