package com.icia.adaco.controller.mvc;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

public class SystemController {
	@GetMapping("/system/msg")
	public ModelAndView msg() {
		return new ModelAndView("main").addObject("viewName", "system/msg.jsp");
	}
}
