package com.icia.adaco.controller.mvc;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.service.mvc.*;

@Controller
public class AdminBoardController {
	
	@Autowired
	AdminBoardService service;

	@GetMapping("/admin/report_list")
	@PreAuthorize("isAuthenticated")
	//@Secured("ROLE_ADMIN")
	public ModelAndView reportList(@RequestParam(defaultValue = "1")int pageno) {
		return new ModelAndView("admin/main").addObject("viewName", "admin/report_list.jsp").addObject("reportPage", service.list(pageno));
	}
	
}
