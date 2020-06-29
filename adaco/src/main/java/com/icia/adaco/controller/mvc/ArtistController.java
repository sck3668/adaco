package com.icia.adaco.controller.mvc;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class ArtistController {
	@Autowired
	private ArtistService artistService;
	@GetMapping("/shop/write")
	public ModelAndView 
}
