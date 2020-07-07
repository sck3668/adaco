package com.icia.adaco.controller.mvc;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	// 주문 하기
	@GetMapping("/order/ordering")
	public ModelAndView Ordering(Principal principal, Order order, int artno, String username, int orderno) {
		String id = principal.getName();
		orderService.Ordering(order);
//		String user = username(principal.getName());
		return new ModelAndView("main").addObject("viewName", "order/ordering.jsp");
	}
	
	// 주문하기
	@PostMapping("/order/ordering")
	public ResponseEntity<?> Ordering(Order order, Principal principal){
		return ResponseEntity.ok(orderService.Ordering(order));
	}
		
	// 결제하기
	@GetMapping("/order/payment")
	public ModelAndView Payment() {
		return new ModelAndView("main").addObject("viewName", "order/payment.jsp");
//		.addObject("order",service.Ordering(dto.forRead,orderservice));
	}

	// 주문 내역 보기
	@GetMapping("/order/list")
	public ModelAndView findAllByOrder() {
		return new ModelAndView("main").addObject("viewName", "order/list.jsp");
	}

	// 주문 상세 보기
	@GetMapping("/order/read")
	public ModelAndView findByOrder() {
		return new ModelAndView("main").addObject("viewName", "order/read");
	}

	// 결제 완료
	@GetMapping("/order/after")
	public ModelAndView after() {
		return new ModelAndView("main").addObject("viewName", "order/after.jsp");
	}

//	// 장바구니에서 주문
//	@GetMapping("/order/carByorder")
//	public ModelAndView orderDetail2(OrderDetailDto.DtoForOrdering Dto, Order order, String username,
//			Integer shippingCharge) {
//		orderService.Ordering(username, shippingCharge, order, shippingCharge);
//		return new ModelAndView("main").addObject("viewName", "order/carByorder");
//	}

}