package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;

import org.springframework.beans.factory.annotation.*;
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
import com.icia.adaco.service.mvc.*;

@Controller
public class ShopController {
	@Autowired
	private ShopService shopService;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private ArtistDao artistDao;
	
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
		System.out.println("artisno======"+artistno);
		Shop shop = shopDao.readShopByArtistno(artistno);
		System.out.println("shop====="+shop);
		int shopno = shop.getShopno();
		System.out.println("shopno===="+shopno);
		return new ModelAndView("main").addObject("viewName","artist/shopRead.jsp")
				.addObject("shop",shopService.shopRead(shopno));
				
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/artist/shopPage")
	public ModelAndView shopPage(Principal principal) {
		int artistno = artistDao.findArtistnoByUsername(principal.getName());
		Shop shop = shopDao.readShopByArtistno(artistno);
		int shopno = shop.getShopno();
		if(shop.getShopno()==null) {
		}
		return new ModelAndView("main").addObject("viewName","artist/shopPage.jsp").addObject("shop",shopService.shopRead(shopno));
	}
	
	
}
