package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;
import java.time.format.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.core.type.*;
import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailService orderDService;
	@Autowired
	private ArtDao artDao;
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	private msgService msgService;
	@Autowired
	private OrderDetailDao orderDetailDao;
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();
	
	// 주문 하기
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/order/ordering")
	public ResponseEntity<?> Ordering(Order order,Bag bag,Principal principal) {
		if(principal==null) {
			throw new JobFailException("로그인 필요합니다");
		}
		String username = principal.getName();
		return ResponseEntity.ok(orderService.Ordering(order, bag, username));
	}
	
	// 아트상세에서 결제창 이동
	// 넘어오는 orderno는 ordering에서 넘겨주는 orderno
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/order/payment")
	public ModelAndView payment(int artno,Principal principal) {
		return new ModelAndView("main").addObject("viewName","order/payment.jsp")
				.addObject("order",orderService.OrderingD(principal.getName(),artno));
	}
	
	// 장바구니에서 결제창 이동
	// 넘어오는 orderno는 ordering에서 넘겨주는 orderno
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/order/bagPayment")
	public ModelAndView bagPayment(String ordernos,Principal principal) {
		return new ModelAndView("main").addObject("viewName","order/payment.jsp")
				.addObject("order",orderService.bagOrderingD(principal.getName(),ordernos));
	}
	
	
	// 결제버튼 클릭 후 결제완료 창으로 이동
	// 결제 버튼 클릭 후 orderDetail insert(payment)
	// return은 orderDetail read(orderDetail)
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/order/after")
	public ModelAndView after(Principal principal,OrderDto.DtoForAfter dto) {
		orderDService.payment(dto,principal.getName());
		//구매한 수량만큼 작품 재고에서 차감
		List<Integer> artnos = dto.getArtnos();
		for(int artno:artnos) {
//		Art art = artDao.readByArt(dto.getArtno());
		Art art = artDao.readByArt(artno);
		int amount = orderDetailDao.findArtnoByOrderDetail(art.getArtName()).getAmount();
		int stock = art.getStock()-amount;
		if(stock<=0) {
			throw new JobFailException("재고를 확인해주세요");
			}
		art.setStock(stock);
		artDao.updateByArt(art);
		}
//		메시지 보내기 파트
		List<Integer> artistnos = dto.getArtistnos();
		for(int artistno:artistnos) {
//		int artistno = dto.getArtistno();
		String artistName = artistDao.findByid(artistno).getUsername();
		Message message = new Message();
		message.setTitle(artistName+"님의 작품을 구매하셨습니다.");
		StringBuffer str = new StringBuffer();
		str.append(artistName+"님의 작품을 구매하셨습니다.");
		message.setContent(str.toString());
		message.setSendId(artistName);
		message.setRecipientId(principal.getName());
		msgService.send(message);
		}
		return new ModelAndView("main").addObject("viewName","order/after.jsp")
				.addObject("order",orderDService.OrderDetail(dto,principal.getName()))
				.addObject("artist",artistDao.findArtistnoByUsername("sss"));
		
	}
	
	//주문 취소
	@PostMapping("/order/back")
	public ResponseEntity<?> orderBack(String ordernos,Principal principal) {
		return ResponseEntity.ok(orderService.delete(ordernos,principal.getName()));
	}
	
	///////////////////////
	
}