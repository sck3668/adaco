package com.icia.adaco.controller.mvc;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class UserController {
	
	@GetMapping("/user/join")
	public ModelAndView join() {
		return new ModelAndView("main").addObject("viewName","user/join.jsp");
	}
	
	
	
	@GetMapping("/user/login")
	public ModelAndView login() {
		return new ModelAndView("main").addObject("viewName","user/login.jsp");
	}
	
	@GetMapping("/")
	public ModelAndView main() {
		return new ModelAndView("main").addObject("viewName","user/section.jsp");
	}
	
	@GetMapping("/user/reset_pwd")
	public ModelAndView resetPassword() {
		return new ModelAndView("main").addObject("viewName","user/reset_pwd.jsp");
	}
	
	
}
