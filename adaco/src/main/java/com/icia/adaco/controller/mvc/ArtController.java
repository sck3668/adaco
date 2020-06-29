package com.icia.adaco.controller.mvc;

import org.modelmapper.internal.bytebuddy.implementation.bytecode.constant.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.service.mvc.*;

@Controller
public class ArtController {
	@Autowired
	private ArtService artservice;
	
	@GetMapping("/art/list")
	public ModelAndView artList(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("artist/main").addObject("viewName","art/list.jsp").addObject("artPage",artservice.list(pageno));
	}
	
	

}
