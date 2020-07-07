package com.icia.adaco.controller.mvc;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class ArtistController {
	@Autowired
	private ShopService shopSerivce;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private ArtistDao artistDao;
	
	//마이페이지 화면
	//	@PreAuthorize("isAuthenticated()")
		@GetMapping("/artist/artistpage")
		public ModelAndView artistRead(Principal principal) {
			int artistno = artistDao.findArtistnoByUsername(principal.getName());
			Shop shop = shopDao.readShopByArtistno(artistno);
			int shopno = shop.getShopno();
			return new ModelAndView("main").addObject("viewName","artist/artistpage.jsp").addObject("shop",shopSerivce.shopRead(shopno));
		}
	//주문, 배송 관리
//		@PreAuthorize("isAuthenticated()")
		@GetMapping("/artist/orderAdmin")
		public ModelAndView orderAdmin() {
			return new ModelAndView("main").addObject("viewName","artist/orderAdmin.jsp");
		}
	//매출관리
//		@PreAuthorize("isAuthenticated()")
		@GetMapping("/artist/sales")
		public ModelAndView sales() {
			return new ModelAndView("main").addObject("viewName", "artist/sales.jsp");
		}
	//상품 등록은 art에서 작업완료 한거 확인함
	
	
}
