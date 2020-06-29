package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.dto.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class StoryController {
	@Autowired
	private StoryService storyService;

	@GetMapping("story/listStory")
	public ModelAndView listStory(@RequestParam(defaultValue = "1") int storyno) {
		return new ModelAndView("main")
		.addObject("viewName", "story/list.jsp");
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("story/writeStory")
	public ModelAndView writeStory() {
		return new ModelAndView("main").addObject("viewName","story/write.jsp");
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("story/writeStory")
	public String writeStory(StoryBoardDto.DtoForWrite writeDto, Principal principal, MultipartFile sajin) throws IOException {
		writeDto.setWriter(principal.getName());
		return "redirect:/story/storyRead?storyno=" + storyService.storyWrite(writeDto, sajin);
	}
	@GetMapping("story/readStory")
	public ModelAndView readStory(Integer storyno) {
		storyService.storyRead(storyno);
		return new ModelAndView("main").addObject("viewName","story/read.jsp");
	}
}