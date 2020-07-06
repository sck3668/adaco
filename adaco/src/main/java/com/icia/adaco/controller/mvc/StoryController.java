package com.icia.adaco.controller.mvc;

import java.io.*;
import java.net.*;
import java.security.*;

import javax.servlet.http.*;

import org.apache.tomcat.jni.*;
import org.apache.tomcat.util.http.fileupload.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class StoryController {
	@Autowired
	private StoryService storyService;
	@Autowired
	ObjectMapper objectMapper;

	@GetMapping("/story/listStory")
	public ModelAndView listStory(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("main")
		.addObject("viewName","artist/story/list.jsp").addObject("story",storyService.storyList(pageno));
	}
 
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/story/writeStory")
	public ModelAndView writeStory() {
		return new ModelAndView("main").addObject("viewName","artist/story/write.jsp");
	}

	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/story/writeStory")
	public String writeStory(StoryBoardDto.DtoForWrite writeDto, Principal principal, MultipartFile sajin) throws IOException {
		System.out.println(sajin+"controllerc----------");
		writeDto.setWriter(principal.getName());
		return "redirect:/story/readStory?storyno="+storyService.storyWrite(writeDto, sajin);
	}
	@GetMapping("/story/readStory")
	public ModelAndView readStory(Integer storyno) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("main").addObject("viewName","artist/story/read.jsp");		
		StoryBoardDto.DtoForRead dto = storyService.storyRead(storyno);
		String json = objectMapper.writeValueAsString(dto);
		mav.addObject("story", json);
		return mav;
	}
	
	
}