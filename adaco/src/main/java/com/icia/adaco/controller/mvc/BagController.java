package com.icia.adaco.controller.mvc;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class BagController {
	
	@GetMapping("/user/bag")
	public ModelAndView bagRead() {
		return new ModelAndView("main").addObject("viewName", "bag/read.jsp");
	}
	
}
