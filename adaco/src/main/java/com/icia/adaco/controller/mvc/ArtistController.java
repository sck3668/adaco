package com.icia.adaco.controller.mvc;

import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.lang.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;
import com.icia.adaco.service.rest.*;

@Controller
public class ArtistController {
	@Autowired
	private ShopService shopSerivce;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	private ObjectMapper objectMapper;
	@Autowired
	private UserService userService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private ArtRestService artRestService;
	@Autowired
	private OrderService orderService;
	
	
	//마이페이지 화면
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/artist/artistpage")
	public ModelAndView artistpage(Principal principal) {
//		int artistno = artistDao.findArtistnoByUsername(principal.getName());
//		Shop shop = shopDao.readShopByArtistno(artistno);
//		int shopno = shop.getShopno();
//		.addObject("shop",shopSerivce.shopRead(shopno))
		return new ModelAndView("main").addObject("viewName","artist/artistpage.jsp")
				.addObject("user",userService.read(principal.getName()));
	}
	 
	
	//판매목록화면
//	@PreAuthorize("isAuthenticated()")
//	@GetMapping("/artist/artistSellList")
//	public ModelAndView artistSellList() {
//		return new ModelAndView("main").addObject("viewName","artist/artistSellList.jsp");
//	}
	
	// 작가번호로 주문리스트찾기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/artist/artistSellList")
	public ModelAndView artistSellList(@RequestParam(defaultValue ="1")int pageno, Principal principal ){
		return new ModelAndView("main").addObject("viewName","artist/artistSellList.jsp")
				.addObject("page",orderDetailService.OrderListByArtist(pageno,principal.getName()));
//				.addObject("art",artRestService.readArt(artno, principal.getName()))
	}
	
	// 주문 내역 상세 
	@GetMapping("/artist/orderDetail")
	public ModelAndView orderDetail() {
		return new ModelAndView("main").addObject("viewName", "artist/orderDetail.jsp");
	}
	
	
	
	//주문, 배송 관리
//		@PreAuthorize("isAuthenticated()")
		@GetMapping("/artist/orderAdmin")
		public ModelAndView orderAdmin() {
			return new ModelAndView("main").addObject("viewName","artist/orderAdmin.jsp");
		}
//		작가 정보 수정
		@PreAuthorize("isAuthenticated()")
		@GetMapping("/artist/artistRead")
		public ModelAndView artistRead(Principal principal) {
			return new ModelAndView("main").addObject("viewName","artist/artistRead.jsp")
					.addObject("user",userService.read(principal.getName()));
		}
		
		
		
		
	//매출관리
//		@PreAuthorize("isAuthenticated()")
//		@GetMapping("/artist/sales")
//		public ModelAndView sales() {
//			return new ModelAndView("main").addObject("viewName", "artist/sales.jsp");
//		}
		//매출관리 임시  그래프
		// 총매출 관리 
				// sales1
				@RequestMapping(value = "/artist/sales", method = RequestMethod.GET)
				public ModelAndView salesadmin() {
					List<Integer> lastYearList = Arrays.asList(323, 411, 384, 377);
					List<Integer> thisYearList = Arrays.asList(342, 378, 384, 335);
					String lastYearJson = null;
					String thisYearJson = null;
					try {
						lastYearJson = objectMapper.writeValueAsString(lastYearList);
						thisYearJson = objectMapper.writeValueAsString(thisYearList);
					} catch (JsonProcessingException e) {
						e.printStackTrace();
					}
					return new ModelAndView("main").addObject("lastYearList", lastYearJson)
							.addObject("thisYearList", thisYearJson).addObject("viewName","artist/sales.jsp");
				}
				//상품별
				//sales2.jsp
				@RequestMapping(value = "/artist/sales2", method = RequestMethod.GET)
			  	public ModelAndView exam5() {
					List<Integer> list = Arrays.asList(70, 60, 50, 100, 30);
					String json = null;
					try {
						json = objectMapper.writeValueAsString(list);
					} catch (JsonProcessingException e) {
						e.printStackTrace();
					}
			  		return new ModelAndView("main").addObject("list", json).addObject("viewName","artist/sales2.jsp");
			  	}
				
				
				//일일 매출
				//sales3
				@RequestMapping(value = "/artist/sales3", method = RequestMethod.GET)
			  	public ModelAndView exam1() {
			  		int womenCount = 7;
			  		int menCount = 13;
			  		return new ModelAndView("main").addObject("menCount", menCount).addObject("womenCount", womenCount).addObject("viewName","artist/sales3.jsp");
			  	}
				// 월별 매출
				// sales4
				@RequestMapping(value = "/artist/sales4", method = RequestMethod.GET)
			  	public ModelAndView exam3() {
					List<Integer> list = Arrays.asList(21600, 31600, 45200, 25400, 13200, 15300);
					String json = null;
					try {
						json = objectMapper.writeValueAsString(list);
					} catch (JsonProcessingException e) {
						e.printStackTrace();
					}
			  		return new ModelAndView("main").addObject("list", json).addObject("viewName","artist/sales4.jsp");
			  	}
	
	
}
