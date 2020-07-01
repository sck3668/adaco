package com.icia.adaco.controller.mvc;


import java.io.*;
import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.dto.*;
import com.icia.adaco.service.mvc.*;
import com.icia.adaco.service.rest.*;

import lombok.*;

@Controller
public class ArtController {
	@Autowired
	private ArtService artservice;
	@Autowired
	private ArtRestService service;
	
	// 작품 리스트 (작가용)
	@GetMapping("/art/list")
	public ModelAndView artList(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("main").addObject("viewName","art/list.jsp").addObject("artPage",artservice.list(pageno));
	}
	
	// 작품 리스트 (회원용)
	@GetMapping("/art/list2")
	public ModelAndView artListFromUser(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("main").addObject("viewName","user/section.jsp").addObject("artPage",artservice.listFromUser(3));
	}
	
	// 작품 상세보기 (작가용)
	@GetMapping("/art/read2")
	public ModelAndView read(@NonNull Integer artno) {
		return new ModelAndView("main").addObject("viewName","art/read.jsp");
	}
	
	// 작품 상세보기 (회원용)
	@GetMapping("/art/read")
	public ModelAndView readFromUser(@NonNull int artno , Integer optno, String username) {
		return new ModelAndView("main").addObject("viewName","art/read.jsp").addObject("artPage",service.readArtFromUser(52, 83, "spring2321"));
	}

	// 작품 등록
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/art/write")
	public ModelAndView write() {
		return new ModelAndView("main").addObject("viewName","art/write.jsp");
	}
	
	//작품 등록
	//@CacheEvict(value="findAllCachce", allEntries = true)
	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/art/write")
	public String write(ArtDto.DtoForWrite dto, BindingResult results,MultipartFile artSajin, Principal principal) throws BindException {
		if(results.hasErrors())
			throw new BindException(results);
		dto.setUsername(principal.getName());
		try {
			artservice.write(dto, artSajin);
		} catch(IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return "redirect:/art/list";
	}
	
	
}
