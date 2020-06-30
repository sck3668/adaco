package com.icia.adaco.controller.mvc;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller	
public class TestController {
	
	@GetMapping("/aa/aa")
	public ModelAndView Test() {
		return new ModelAndView("main").addObject("viewName", "admin/test.jsp");
	}
}
