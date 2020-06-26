package com.icia.adaco.controller.mvc;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class UserController {
	
	@GetMapping("/user/login")
	public ModelAndView login() {
		return new ModelAndView("main").addObject("user/login.jsp");
	}
}
