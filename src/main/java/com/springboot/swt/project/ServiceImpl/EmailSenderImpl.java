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
    public String sendEmail(String to, String subject, String massage, String purpose) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("coachingswt@gmail.com", "yzuh lefx xkkt ussk");
            }
        });
        try {
            String messagetemplate = "";
            if (!purpose.equals("regis"))
                messagetemplate = "We've received a request to reset your password for your Softwaves account.\r\n"
                        + "\r\n"
                        + "To verify your identity, please enter the following 6-digit OTP code:\r\n"
                        + "\r\n"
                        + "" + massage + "\r\n"
                        + "\r\n"
                        + "This code is valid for 5 minutes.\r\n"
                        + "\r\n"
                        + "If you did not request this password reset, please ignore this email.\r\n"
                        + "\r\n"
                        + "Thank you";

            else
                messagetemplate = "We've received a request from this email address for registration of your Softwaves account.\r\n"
                        + "\r\n"
                        + "To verify your identity, please enter the following 6-digit OTP code:\r\n"
                        + "\r\n"
                        + "" + massage + "\r\n"
                        + "\r\n"
                        + "This code is valid for 5 minutes.\r\n"
                        + "\r\n"
                        + "If you did not request for registration, please ignore this email.\r\n"
                        + "\r\n"
                        + "Thank you";
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("coachingswt@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(messagetemplate);
            Transport.send(message);

            return "Email sent successfully!";
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return "Email not sent!";
    }

}