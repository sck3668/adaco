package com.icia.adaco.controller.mvc;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class ArtistController {
	
	//마이페이지 화면
		@GetMapping("/artist/artistpage")
		public ModelAndView artistRead() {
			return new ModelAndView("main").addObject("viewName","artist/artistpage.jsp");
		}
	//주문, 배송 관리
		@GetMapping("/artist/orderAdmin")
		public ModelAndView orderAdmin() {
			return new ModelAndView("main").addObject("viewName","artist/orderAdmin.jsp");
		}
	//매출관리
		@GetMapping("/artist/sales")
		public ModelAndView sales() {
			return new ModelAndView("main").addObject("viewName", "artist/sales.jsp");
		}
	//상품 등록은 art에서 작업완료 한거 확인함
	
	
}
