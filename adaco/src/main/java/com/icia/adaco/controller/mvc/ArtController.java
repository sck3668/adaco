package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;
import java.util.*;

import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.lang.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
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
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	ObjectMapper objectMapper;
	@Autowired
	private AdminBoardService adminBoardService;
	
	// 작품 리스트 (작가용)
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/art/listByArtist")
	public ModelAndView artList(@RequestParam(defaultValue = "1") int pageno, @Nullable String category, Principal principal) {
		String username = principal.getName();
		return new ModelAndView("main").addObject("viewName","art/list.jsp").addObject("artPage",artservice.list(pageno, category, username));
	}
	
	// 작품 리스트(최신순) + 작품 이름으로 작품 검색(회원용)
	@GetMapping({"/art/listByUser","/"})
	public ModelAndView artListFromUser(@RequestParam(defaultValue = "1") int pageno, @Nullable String artname, @Nullable String category,@Nullable String writer) {
		return new ModelAndView("main").addObject("viewName","user/section.jsp").addObject("artPage",artservice.listFromUser(pageno, artname, category,writer));
	}
	
	// 작품 리스트 (리뷰순) + 작품 이름으로 작품 검색 (회원용)
	@GetMapping("/user/artListByReview")
	public ModelAndView listReviewManyArt(@RequestParam(defaultValue = "1") int pageno, @Nullable String artname) {
		return new ModelAndView("main").addObject("viewName","user/manyReview.jsp").addObject("artReviewPage",artservice.listManyReview(pageno, artname));
	}
	
	// 작품 상세보기 (작가용)
	@GetMapping("/art/readByArtist")
	public ModelAndView read(@NonNull Integer artno, @Nullable Principal principal) {
		String username = principal.getName();
		return new ModelAndView("main").addObject("viewName","art/detailread.jsp").addObject("artDetailPage",service.readArt(artno, username)).addObject("image", service.readArtImage(artno));
	}
	
	// 작품 상세보기 (회원용)
	@GetMapping("/art/readByUser")
	public ModelAndView readFromUser(@NonNull int artno ,@Nullable Principal principal) throws JsonProcessingException{
		String username = principal!=null?principal.getName():null;
		ModelAndView mav= new ModelAndView("main").addObject("viewName","art/read.jsp").addObject("artPageByUser", service.readArtFromUser(artno, username))
				.addObject("image", service.readArtImage(artno));
		ArtDto.DtoForRead dto = service.readArtFromUser(artno, username);
		System.out.println(dto+"디티오");
		String json = objectMapper.writeValueAsString(dto);
		mav.addObject("art",json);
		System.out.println("제이슨"+json);
		return mav;
	}
                                                           	
	// 작품 등록 + 등록시 필요한 artistno, shopno 받아오기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/art/write")
	public ModelAndView write(Principal principal) {
		//상점 개설 안했을 경우 작품 등록 하지 못하고 상점개설하시겠습니까 메시지 출력 후 이동
		int artistno = artistDao.findArtistnoByUsername(principal.getName());
		if(shopDao.readShopnoByArtistno(artistno)==null) {
			return new ModelAndView("main").addObject("viewName","artist/artistpage.jsp")
					.addObject("msg","writeMsg");
		};
		return new ModelAndView("main").addObject("viewName","art/write.jsp").addObject("artInfo", artservice.infoRead(principal.getName()))
				.addObject("category",adminBoardService.categoryList());
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
	
	// 리뷰 등록시 구매자인시 체크
	@GetMapping("/art/paymentCheck")
	public ResponseEntity<?> paymentCheck(Principal principal, String artName) {
		return ResponseEntity.ok(artservice.paymentCheck(principal.getName(),artName));
	}
	
	// 
}