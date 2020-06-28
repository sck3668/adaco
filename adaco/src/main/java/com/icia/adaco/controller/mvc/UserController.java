package com.icia.adaco.controller.mvc;

import java.io.*;
import java.time.*;
import java.util.*;

import javax.mail.*;
import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.lang.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.icia.adaco.util.editor.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class UserController {
	@InitBinder
	public void init(WebDataBinder wdb) {
		wdb.registerCustomEditor(List.class, "authorities", new AuthorityPropertyEditor());
		wdb.registerCustomEditor(LocalDateTime.class, "birthDate", new DatePropertyEditor());
	}
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/user/join")
	public ModelAndView join() {
		return new ModelAndView("main").addObject("viewName","user/join.jsp");
	}
	
	@PostMapping("/user/join")
	public String join(@Valid UserDto.DtoForJoin dto, BindingResult bindingResult, @Nullable MultipartFile sajin, RedirectAttributes ra) throws BindException {
		System.out.println("controller==================");
		System.out.println("C---dto"+dto);
		System.out.println("sajin============"+sajin);
		if(bindingResult.hasErrors()==true) 
			throw new BindException(bindingResult);
		try {
			System.out.println("servicejoin");
			userService.join(dto, sajin);
		} catch (IllegalStateException | IOException | MessagingException e) {
			e.printStackTrace();
		}
		System.out.println("=============msgg");
		ra.addFlashAttribute("msg", "가입확인메일을 보냈습니다. 확인해주십시오");
		return "redirect:/system/msg";
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
	
	@GetMapping("/user/findId")
	public ModelAndView findId() {
		return new ModelAndView("main").addObject("viewName","user/find_id.jsp");
	}
	
	@GetMapping("/user/findId")
	public ModelAndView findIdPwd() {
		return new ModelAndView("main").addObject("viewName","user/find_id.jsp");
	}
	
}
