package com.icia.adaco.controller.mvc;

import java.io.*;
import java.net.*;
import java.security.*;

import javax.servlet.http.*;
import javax.validation.constraints.*;

import org.apache.tomcat.jni.*;
import org.apache.tomcat.util.http.fileupload.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.service.mvc.*;
import com.icia.adaco.service.rest.*;

@Controller
public class StoryController {
	@Autowired
	private StoryService storyService;
	@Autowired
	ObjectMapper objectMapper;
	@Autowired
	private StoryRestService storyRestService;
	@Autowired
	private StoryRestService restService;

	@GetMapping("/story/listStory")
	public ModelAndView listStory(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("main")
		.addObject("viewName","artist/story/list.jsp").addObject("story",storyService.storyList(pageno));
	}
 
	//@PreAuthorize("hasRole('ROLE_SELLER')")
	@GetMapping("/story/writeStory")
	public ModelAndView writeStory() {
		return new ModelAndView("main").addObject("viewName","artist/story/write.jsp");
	}

	//@PreAuthorize("hasRole('ROLE_SELLER')")
	@PostMapping("/story/writeStory")
	public String writeStory(StoryBoardDto.DtoForWrite writeDto, Principal principal, MultipartFile sajin) throws IOException {
		System.out.println(sajin+"controllerc----------");
		writeDto.setWriter(principal.getName());
		return "redirect:/story/readStory?storyno="+storyService.storyWrite(writeDto, sajin);
	}
	
	//스토리 댓글 리스트 출력
	@GetMapping("/story/readStory")
	public ModelAndView readStory(Integer storyno,@RequestParam(defaultValue ="1")int pageno) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("main").addObject("viewName","artist/story/read.jsp")
				.addObject("story",storyService.storyRead(storyno, pageno));
		/*
		 * StoryBoardDto.DtoForRead dto = storyService.storyRead(storyno,pageno);
		 * System.out.println(dto); String json = objectMapper.writeValueAsString(dto);
		 * mav.addObject("story", json); System.out.println("mav============="+mav);
		 */
		
		System.out.println("mav============"+mav);
		return mav;
	}
	
	@PostMapping("/story/readStory")
	public ResponseEntity<?> read(@RequestParam @NotNull Integer storyno, Principal principal) throws JsonProcessingException {
		System.out.println(storyno);
		System.out.println("readStory================");
		System.out.println(restService.readComment(storyno, principal.getName()));
		return ResponseEntity.ok(restService.readComment(storyno, principal.getName()));
	}
	
	
}