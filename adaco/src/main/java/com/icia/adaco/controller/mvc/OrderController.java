package com.icia.adaco.controller.mvc;

import java.security.*;
import java.time.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.fasterxml.jackson.databind.*;
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
	private ObjectMapper objectMapper = new ObjectMapper();
	// 주문 하기
		@PostMapping("/order/ordering")
		public ResponseEntity<?> Ordering(Order order,Bag bag,Principal principal) {
			if(principal==null) {
				throw new JobFailException("로그인 필요합니다");
			}
			String username = principal.getName();
			
//			String user = username(principal.getName());
			return ResponseEntity.ok(orderService.Ordering(order, bag, username));
		}
		
		
		
		// 결제창 이동
		// 넘어오는 orderno는 ordering에서 넘겨주는 orderno
		@GetMapping("/order/payment")
		public ModelAndView payment(int artno,Principal principal) {
			return new ModelAndView("main").addObject("viewName","order/payment.jsp")
					.addObject("order",orderService.OrderingD(principal.getName(),artno));
		}
		
		// 결제버튼 클릭 후 주문완료 창으로 이동
		// 결제 버튼 클릭 후 orderDetail insert(payment)
		// return은 orderDetail read(orderDetail)
		@GetMapping("/order/after")
		public ModelAndView after(Principal principal,OrderDto.DtoForAfter dto) {
			System.out.println("after dto==="+dto);
			int orderno = dto.getOrderno();
			orderDService.payment(dto,principal.getName());
			return new ModelAndView("main").addObject("viewName","order/after.jsp").addObject("order",orderDService.OrderDetail(dto,principal.getName()));
		}
	
	
	
	
	
	
	////////////////////////////////////
	// 주문 하기
	//@GetMapping("/order/ordering")
	public ModelAndView Ordering(Order order,Bag bag) {
		String id = principal.getName();
		orderService.Ordering(order, bag);
//		String user = username(principal.getName());
		return new ModelAndView("main").addObject("viewName", "order/ordering.jsp").addObject("ordering",orderService.Ordering(order,bag));
	}
	
	// 주문하기
	//@PostMapping("/order/ordering")
	public ResponseEntity<?> Ordering(Order order, Principal principal,Bag bag){
		return ResponseEntity.ok(orderService.Ordering(order,bag));
	}
		
	// 결제하기
	//@GetMapping("/order/payment")
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
	//@GetMapping("/order/after")
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