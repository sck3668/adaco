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
import org.springframework.lang.*;
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

import lombok.*;
import lombok.NonNull;

@Controller
public class StoryController {
	@Autowired
	private StoryService storyService;
	@Autowired
	ObjectMapper objectMapper;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private StoryDao storyDao;
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	private StoryRestService storyRestService;
	@Autowired
	private StoryRestService restService;

	//스토리 목록 출력
	@GetMapping("/story/listStory")
	public ModelAndView listStory(@RequestParam(defaultValue = "1") int pageno,@Nullable Integer artistno) {
		return new ModelAndView("main")
		.addObject("viewName","artist/story/list.jsp").addObject("story",storyService.storyList(pageno,artistno));
	}
	
	// 스토리 작성 화면
	@PreAuthorize("hasRole('ROLE_SELLER')")
	@GetMapping("/story/writeStory")
	public ModelAndView writeStory(Principal principal) {
		int artistno = artistDao.findArtistnoByUsername(principal.getName());
		System.out.println("artistno=="+artistno);
		if(shopDao.readShopnoByArtistno(artistno)==null) {
			System.out.println();
			return new ModelAndView("main").addObject("viewName","artist/artistpage.jsp")
					.addObject("msg","StoryWriteMsg");
		};
		return new ModelAndView("main").addObject("viewName","artist/story/write.jsp");
	}
	
	// 스토리 작성
	@PreAuthorize("hasRole('ROLE_SELLER')")
	@PostMapping("/story/writeStory")
	public String writeStory(StoryBoardDto.DtoForWrite writeDto, Principal principal, MultipartFile sajin) throws IOException {
		writeDto.setWriter(principal.getName());
		return "redirect:/story/readStory?storyno="+storyService.storyWrite(writeDto, sajin,principal.getName());
	}
	
	// 스토리 출력
	@GetMapping("/story/readStory")
	public ModelAndView readStory(@NonNull Integer storyno) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("main").addObject("viewName","artist/story/read.jsp").addObject("story",storyService.storyRead(storyno));
		StoryBoardDto.DtoForRead dto = storyService.storyRead(storyno);
		String json = objectMapper.writeValueAsString(dto);
		mav.addObject("story", json);
		return mav;
	}
}