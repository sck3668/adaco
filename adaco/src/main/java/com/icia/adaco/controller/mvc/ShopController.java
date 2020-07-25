package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.lang.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class ShopController {
	@Autowired
	private ShopService shopService;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	private ArtService artService;
	@Autowired
	private ArtDao artDao;
	
	//상점개설 화면
//	@PreAuthorize("isAuthenticated()")
	@GetMapping("/artist/shopMade")
	public ModelAndView shopMade() {
		return new ModelAndView("main").addObject("viewName","artist/shopMade.jsp");
	}
	
	//상점개설 처리
	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/artist/shopMade")
	public String shopMade(ShopDto.DtoForMade shopMadeDto, @Nullable MultipartFile sajin, RedirectAttributes ra, Principal principal) throws IllegalStateException, IOException  {
			shopService.shopMade(shopMadeDto, sajin, principal.getName());
			return "redirect:/artist/shopRead";
	}
	
	//상점보기 화면
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/artist/shopRead")
	public ModelAndView shopRead(Principal principal, @Nullable MultipartFile sajin) {
		int artistno = artistDao.findArtistnoByUsername(principal.getName());
		Shop shop = shopDao.readShopByArtistno(artistno);
		int shopno = shop.getShopno();
		return new ModelAndView("main").addObject("viewName","artist/shopRead.jsp")
				.addObject("shop",shopService.shopRead(shopno));
	}
	
	//작가가 보는 상점페이지
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/artist/shopPage")
	public ModelAndView shopPage(Principal principal,@Nullable Integer artno) {
		int artistno;
		if(artistDao.findArtistnoByUsername(principal.getName())!=null) {
			artistno = artistDao.findArtistnoByUsername(principal.getName());
		}
		else {
			artistno = artDao.findArtistnoByArtno(artno);
		}
//		int artistno = artistDao.findArtistnoByUsername(principal.getName());
		Shop shop = shopDao.readShopByArtistno(artistno);
		if(shop==null) {
			return new ModelAndView("main").addObject("viewName","artist/artistpage.jsp")
					.addObject("msg","msg");
			}
		int shopno = shop.getShopno();
		
		return new ModelAndView("main").addObject("viewName","artist/shopPage.jsp").addObject("shop",shopService.shopRead(shopno));
	
	}
	
	// 회원이 보는 상점 페이지
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/artist/shopPageByUser")
	public ModelAndView shopPageByUser(Principal principal,@Nullable Integer artno) {
		int artistno;
		if(artistDao.findArtistnoByUsername(principal.getName())!=null) {
			artistno = artistDao.findArtistnoByUsername(principal.getName());
		}
		else {
			artistno = artDao.findArtistnoByArtno(artno);
		}
//		int artistno1 = artistDao.findArtistnoByUsername(principal.getName());
		Shop shop = shopDao.readShopByArtistno(artistno);
		if(shop==null) {
			return new ModelAndView("main").addObject("viewName","artist/artistpage.jsp")
					.addObject("msg","msg");
			}
		int shopno = shop.getShopno();
		
		return new ModelAndView("main").addObject("viewName","artist/shopPageByUser.jsp").addObject("shop",shopService.shopRead(shopno));
	
	}
	
	// shop이 존재하는지 체크
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/artist/checkShop")
	public ResponseEntity<?> shopCheck(Principal principal) {
		return ResponseEntity.ok(shopService.shopCheck(principal.getName()));
	}
}
