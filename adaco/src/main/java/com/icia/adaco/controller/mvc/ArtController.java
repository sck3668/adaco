package com.icia.adaco.controller.mvc;


import java.io.*;
import java.security.*;
import java.util.*;

import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.lang.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.dto.*;
import com.icia.adaco.service.mvc.*;
import com.icia.adaco.service.rest.*;

import lombok.NonNull;

@Controller
public class ArtController {
	@Autowired
	private ArtService artservice;
	@Autowired
	private ArtRestService service;
	
	// 작품 리스트 (작가용)
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/art/listByArtist")
	public ModelAndView artList(@RequestParam(defaultValue = "1") int pageno, @Nullable String category, Principal principal) {
		System.out.println("controller");
		String username = principal.getName();
		return new ModelAndView("main").addObject("viewName","art/list.jsp").addObject("artPage",artservice.list(pageno, category, username));
	}
	
	// 작품 리스트(최신순) + 작품 이름으로 작품 검색(회원용)
	@GetMapping({"/art/listByUser","/"})
	public ModelAndView artListFromUser(@RequestParam(defaultValue = "1") int pageno, @Nullable String artname) {
		return new ModelAndView("main").addObject("viewName","user/section.jsp").addObject("artPage",artservice.listFromUser(pageno, artname));
	}
	
	// 작품 리스트 (일단 리뷰5이상인) (회원용)
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/artListByReview")
	public ModelAndView listReviewManyArt(@RequestParam(defaultValue = "1") int pageno, @Nullable String artname) {
		return new ModelAndView("main").addObject("viewName","user/manyReview.jsp").addObject("artReviewPage",artservice.listManyReview(pageno));
	}
	
	// 작품 상세보기 (작가용)
	@GetMapping("/art/readByArtist")
	public ModelAndView read(@NonNull Integer artno, @Nullable Principal principal) {
		String username = principal.getName();
		return new ModelAndView("main").addObject("viewName","art/detailread.jsp").addObject("artDetailPage",service.readArt(artno, username)).addObject("image", service.readArtImage(artno));
	}
	
	// 작품 상세보기 (회원용)
	@GetMapping("/art/readByUser")
	public ModelAndView readFromUser(@NonNull int artno ,@Nullable Principal principal) {
		System.out.println("상세" + artno);
		if(principal!= null) {
			String username =  principal.getName();
		} 
			String username = "isAnonymous()";
		return new ModelAndView("main").addObject("viewName","art/read.jsp").addObject("artPageByUser", service.readArtFromUser(artno, username))
				.addObject("image", service.readArtImage(artno));
	}
	
	// 작품 등록 + 등록시 필요한 artistno, shopno 받아오기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/art/write")
	public ModelAndView write(Principal principal) {
		return new ModelAndView("main").addObject("viewName","art/write.jsp").addObject("artInfo", artservice.infoRead(principal.getName()));
	}
	
	//작품 등록
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/art/write")
	public String write(@Valid ArtDto.DtoForWrite dto, BindingResult results, List<MultipartFile> artSajin, Principal principal) throws BindException {
		if(results.hasErrors())
			throw new BindException(results);
		dto.setUsername(principal.getName());
		try {
			artservice.write(dto, artSajin);
		} catch(IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return "redirect:/art/listByArtist";
	}
}