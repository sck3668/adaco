package com.icia.adaco.controller.mvc;

import java.security.*;


import javax.validation.*;
import javax.validation.constraints.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.service.mvc.*;
@PreAuthorize("isAuthenticated()")
@Controller
public class MessageController {
	@Autowired
	private msgService msgService;
	
	// 메시지 작성 화면
	@GetMapping("/message/write")
	public ModelAndView write(@RequestParam @NotNull String recipientId) {
		return new ModelAndView("main").addObject("viewName", "message/write.jsp").addObject("recipientId", recipientId);
	}
	
	// 메시지 보내기
	@PostMapping("/message/write")
	public ModelAndView write(Message msg, BindingResult results, Principal principal) throws BindException {
		if(results.hasErrors())
			throw new BindException(results);
		msgService.send(msg.setSendId(principal.getName()));
		return new ModelAndView("redirect:/message/listSender");
	}
	
	//보낸 메시지 목록
	@GetMapping("/message/listSender")
	public ModelAndView listSend(Principal principal) {
		return new ModelAndView("main").addObject("viewName","message/list_sender.jsp").addObject("list",msgService.findBySender(principal.getName()));
	}
	
	// 받은 메시지 목록
	@GetMapping("/message/listReceiver")
	public ModelAndView listReceiver(Principal principal) {
		return new ModelAndView("main").addObject("viewName","message/list_receiver.jsp").addObject("list",msgService.findByReceiver(principal.getName()));
	}
	
	//메시지 읽기
	@GetMapping("/message/read")
	public ModelAndView read(@RequestParam @NotNull int mno) {
		return new ModelAndView("main").addObject("viewName","message/read.jsp").addObject("msg",msgService.findById(mno));
	}
}
