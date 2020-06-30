package com.icia.adaco.controller.mvc;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class SystemController {
	
	@GetMapping("/system/msg")
	public ModelAndView msg() {
		return new ModelAndView("main").addObject("viewName", "system/msg.jsp");
	}
}
