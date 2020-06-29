package com.icia.adaco.controller.mvc;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.service.mvc.*;
import com.sun.istack.internal.Nullable;

@Controller
public class AdminUserController {

	@Autowired
	AdminUserService service;
	
	@GetMapping("/admin/user_list")
//	@PreAuthorize("isAuthenticdated()")
//	@Secured("ROLE_ADMIN")
	public ModelAndView userList(@RequestParam(defaultValue = "1")int pageno, @Nullable String username) {
		return new ModelAndView("admin/user_list").addObject("userPage", service.userList(pageno, username));
	}
	
	@GetMapping("/admin/artist_list")
	public ModelAndView artistList(@RequestParam(defaultValue = "1") int pageno, @Nullable String username) {
		return new ModelAndView("admin/user_list").addObject("artistPage", service.artistList(pageno, username));
	}
	
	
}
