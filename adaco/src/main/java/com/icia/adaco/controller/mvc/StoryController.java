package com.icia.adaco.controller.mvc;

import java.security.*;

import javax.servlet.http.*;
import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class StoryController {
	@Autowired
	private StoryService storyService; 
	

	@GetMapping("story/listStory")
	public ModelAndView listStory() {
		return new ModelAndView("main").addObject("viewName", "story/list.jsp");
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("story/writeStory")
	public ModelAndView writeStory() {
		return new ModelAndView("main").addObject("viewName","story/write.jsp");
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("story/writeStory")
	public String writeStory(Principal principal,String writer,@Valid StoryBoardDto.DtoForWrite writeDto,HttpServletRequest request) {
		writeDto.setWriter(principal.getName());
		storyService.storyWriter();
	}
}
