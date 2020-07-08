package com.icia.adaco.controller.mvc;

import org.springframework.beans.factory.annotation.*;
import org.springframework.lang.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.service.mvc.*;

@Controller
public class AdminUserController {

	@Autowired
	AdminUserService service;
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/user_list")
	public ModelAndView userList(@RequestParam(defaultValue = "1")int pageno, @Nullable String username) {
		return new ModelAndView("admin/user/list").addObject("userPage", service.userList(pageno, username));
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/artist_list")
	public ModelAndView artistList(@RequestParam(defaultValue = "1") int pageno, @Nullable String username) {
		return new ModelAndView("admin/artist/list").addObject("artistPage", service.artistList(pageno, username));
	}

	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/user_read")
	public ModelAndView userRead(String username) {
		return new ModelAndView("admin/user/read").addObject("user", service.userRead(username)).addObject("authorityType", service.getAuthorityType());
	}
	
}
