package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.core.type.*;
import com.fasterxml.jackson.databind.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class OrderDetailController {

		@Autowired
		private OrderDetailService service;
		@Autowired
		private OrderService orderService;
		@Autowired
		private ObjectMapper objectMapper = new ObjectMapper();
		
		
<<<<<<< HEAD
	// 주문 내역 상세 
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/orderdetail/orderdetail")
	public ModelAndView orderDetail( ) {
		return new ModelAndView("main").addObject("viewName", "order_detail/orderdetail.jsp");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/orderdetail/payment")
	public String buyAll(String json,Principal principal) throws JsonParseException, JsonMappingException, IOException {
		List<Order> list = objectMapper.readValue(json, new TypeReference<List<Order>>() {});
		System.out.println(list);
		return null;
	}
=======
//		@GetMapping("/orderdetail/ordering")
//		public String findbyOrderDetail(Principal principal,String username,Integer orderno) {
//			String id = principal.getName();
//			service.OrderDetail(principal, username, orderdetail, orderno);
//			return "redirect:/";		
//			//	return new ModelAndView("main").addObjectw("viewName", "order_detail/ordering.jsp");
//		}
		
		// 결제하기
//		@GetMapping("/orderdetail/payment")
//		public ModelAndView Payment(String json,Principal principal,Order order) throws JsonParseException, JsonMappingException, IOException {
//			System.out.println("json=========="+json.getBytes());
//			orderService.Ordering(order);
//			Order order = objectMapper.readValue(json, new TypeReference<List<Order>>() {});
//			return new ModelAndView("main").addObject("viewName", "order_detail/payment.jsp").addObject("order", objectMapper.readValue(json, new TypeReference<List<Order>>() {}));
//		}
		
		// 주문 내역 상세 
		@GetMapping("/orderdetail/orderdetail")
		public ModelAndView orderDetail( ) {
			return new ModelAndView("main").addObject("viewName", "order_detail/orderdetail.jsp");
		}
		
		
		@PostMapping("/orderdetail/payment")
		public String buyAll(String json,Principal principal) throws JsonParseException, JsonMappingException, IOException {
			List<Order> list = objectMapper.readValue(json, new TypeReference<List<Order>>() {});
			System.out.println(list);
			return null;
		}
		

>>>>>>> branch 'master' of https://github.com/sck3668/adaco.git
}