package com.home.shop3.controller.user;

import java.io.IOException;
import java.util.Date;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailMessage;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.shop3.controller.BaseController;
import com.home.shop3.entities.user.ContactEntity;
import com.home.shop3.service.user.ContactService;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ContactController extends BaseController {
	
	@Autowired
	protected ContactService contactService;
	
	@Autowired
	protected JavaMailSender mailSender;
	
	
	@RequestMapping(value = "/contact", method=RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse respose) throws IOException{

		ContactEntity contact=new ContactEntity();
		model.addAttribute("newContact", contact);

		return "common/user/contact";
	}
	@RequestMapping(value="/contact", method=RequestMethod.POST)
	public String contact(final Model model, final HttpServletRequest request,final HttpServletResponse response, @ModelAttribute("newContact") ContactEntity contact ) {
		Date date=new Date();
		date=java.util.Calendar.getInstance().getTime();
//		System.out.println(date);
//		System.out.println(java.time.LocalDateTime.now());
		contact.setCreatedDate(date);
		System.out.println(contact.getName());
		
		sendEmail( "conchimtuhu1357@gmail.com" ,contact.getEmail(), "Thank "+contact.getEmail()+ " for mail for us", "");
		
//		final String username = "conchimtuhu1357@gmail.com";
//        final String password = "beqktzpazvkmziwc";
//
//        Properties prop = new Properties();
//		prop.put("mail.smtp.host", "smtp.gmail.com");
//        prop.put("mail.smtp.port", "587");
//        prop.put("mail.smtp.auth", "true");
//        prop.put("mail.smtp.starttls.enable", "true"); //TLS
//        
//        jakarta.mail.Session session = jakarta.mail.Session.getInstance(prop,
//                new jakarta.mail.Authenticator() {
//                    protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
//                        return new jakarta.mail.PasswordAuthentication(username, password);
//                    }
//                });
//
//        try {
//
//            jakarta.mail.Message message = new jakarta.mail.internet.MimeMessage(session);
//            message.setFrom(new jakarta.mail.internet.InternetAddress("conchimtuhu1357@gmail.com"));
//            message.setRecipients(
//                    Message.RecipientType.TO,
//                    InternetAddress.parse("hieu271101@gmail.com")
//            );
//            message.setSubject("Testing Gmail TLS");
//            message.setText("Dear Mail Crawler,"
//                    + "\n\n Please do not spam my email!");
//
//            jakarta.mail.Transport.send(message);
//
//            System.out.println("Done");
//
//        } catch (MessagingException e) {
//        	System.out.print("Nó vô đây á");
//            e.printStackTrace();
//        }
        contactService.saveOrUpdate(contact);
		return "redirect:";
	}
	
	
	public void sendEmail(String from,String to,String subject, String content) {
		SimpleMailMessage mailMessage=new SimpleMailMessage();
		mailMessage.setFrom(from);
		mailMessage.setTo(to);
		mailMessage.setSubject(subject);
		mailMessage.setText(content);
		
		mailSender.send(mailMessage);
	}
}
