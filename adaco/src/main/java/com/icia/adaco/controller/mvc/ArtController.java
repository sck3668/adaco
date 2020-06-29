package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.dto.*;
import com.icia.adaco.service.mvc.*;

import lombok.*;

@Controller
public class ArtController {
	@Autowired
	private ArtService artservice;
	@Autowired
	private static Map<String, MediaType> mediaMap;
	
	// 작품 리스트
	@GetMapping("/art/list")
	public ModelAndView artList(@RequestParam(defaultValue = "1") int pageno) {
		return new ModelAndView("artist/main").addObject("viewName","art/list.jsp").addObject("artPage",artservice.list(pageno));
	}
	
	// 작품 상세보기
	@GetMapping("/art/read")
	public ModelAndView read(@NonNull Integer artno) {
		return new ModelAndView("artist/main").addObject("viewName","art/read.jsp");
	}
	
	static {
		mediaMap = new HashMap<>();
		mediaMap.put("JPG",	MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	// 작품 등록
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/art/write")
	public ModelAndView write() {
		return new ModelAndView("artist/main").addObject("viewName","art/write.jsp");
	}
	
	//작품 등록
	//@CacheEvict(value="findAllCachce", allEntries = true)
	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/art/write")
	public String write(ArtDto.DtoForWrite dto, BindingResult results, Principal principal) throws BindException {
		if(results.hasErrors())
			throw new BindException(results);
		dto.setUsername(principal.getName());
		/*try {
			return "redirect:/art/read?artno=" + artservice.write(dto);
		} catch(IOException e) {
			e.printStackTrace();
		}*/
		return "redirect:/";
	}
	
	
	
	
	

}
