package com.icia.adaco.controller.mvc;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.service.mvc.*;

@Controller
public class AdminUserController {

	@Autowired
	AdminUserService service;
	
	@GetMapping("/admin/user_list")
	@PreAuthorize("isAuthenticdated()")
//	@Secured("ROLE_ADMIN")
	public ModelAndView userList(@RequestParam(defaultValue = "1")int pageno) {
		return new ModelAndView("admin/main").addObject("viewName", "admin/user_list.jsp").addObject("userPage", service.list(pageno));
	}
	
}
