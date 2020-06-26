package com.icia.adaco.util;

import javax.mail.*;
import javax.mail.internet.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;

import com.icia.adaco.dto.*;

public class MailUtil {
	@Autowired
	private JavaMailSender mailSender;
	// 스프링 메일은 MimeSessage 클래스의 객체를 요구
	// Mail클래스 사용
	public void sendMail(Mail mail) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		// 보낸 사람 이메일
		messageHelper.setFrom(new InternetAddress(mail.getSender()));
		// 받는 사람 이메일
		messageHelper.setTo(mail.getReceiver());
		// 이메일 제목
		messageHelper.setSubject(mail.getTitle());
		// 이메일 내용
		messageHelper.setText(mail.getContent(), true);
		mailSender.send(message);
	}
}