package com.icia.adaco.controller.mvc;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();
<<<<<<< HEAD
	
=======
	private Principal principal;
>>>>>>> branch 'master' of https://github.com/sck3668/adaco.git

	// 주문 하기
	@GetMapping("/order/ordering")
	public ModelAndView Ordering(Order order,Bag bag) {
		String id = principal.getName();
		orderService.Ordering(order, bag);
//		String user = username(principal.getName());
		return new ModelAndView("main").addObject("viewName", "order/ordering.jsp").addObject("ordering",orderService.Ordering(order,bag));
	}
	
	// 주문하기
	@PostMapping("/order/ordering")
	public ResponseEntity<?> Ordering(Order order, Principal principal,Bag bag){
		return ResponseEntity.ok(orderService.Ordering(order,bag));
	}
		
	// 결제하기
	@GetMapping("/order/payment")
	public ModelAndView Payment(Principal principal, OrderDto.DtoForOrdering Dto ) {
		String username = principal.getName();
		System.out.println("========컨트롤러 Dto"+Dto); 
		System.out.println("======유저"+principal.getName());
		return new ModelAndView("main").addObject("viewName", "order/payment.jsp").addObject("orders",orderService.payment(principal.getName(),Dto));
	}
//	@PostMapping("/orderdetail/payment")
//	public String buyAll(String json,Principal principal) throws JsonParseException, JsonMappingException, IOException {
//		List<Order> list = objectMapper.readValue(json, new TypeReference<List<Order>>() {});
//		System.out.println(list);
//		return null;
//	}
	
	// 주문 내역 보기
	@GetMapping("/order/list")
	public ModelAndView findAllByOrder(@RequestParam(defaultValue ="1")int pageno, Principal principal) {
		return new ModelAndView("main")
				.addObject("viewName", "order/list.jsp")
				.addObject("page",orderService.OrderList(pageno,principal.getName()));
	}

	// 주문 상세 보기
	@GetMapping("/order/read")
	public ModelAndView findByOrder() {
		return new ModelAndView("main").addObject("viewName", "order/read.jsp");
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