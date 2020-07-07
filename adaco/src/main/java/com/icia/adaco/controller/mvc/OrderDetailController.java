package com.icia.adaco.controller.mvc;



import java.io.*;
import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.core.type.*;
import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
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
		
//		@GetMapping("/orderdetail/overview")
//		public ModelAndView OrderDetail(Principal principal,Model model) {
//			String id = principal.getName();
//			model.addAttribute("orderlist", (id,orderDetail()));
//			model.addAttribute("viewName", "order_detail.jsp");
//			return new ModelAndView("main").addObject("viewName", "order_detail/orverview.jsp");
//		}
		
//		@GetMapping("/orderdetail/ordering")
//		public String findbyOrderDetail(Principal principal,String username,Integer orderno) {
//			String id = principal.getName();
//			service.OrderDetail(principal, username, orderdetail, orderno);
//			return "redirect:/";
//			//	return new ModelAndView("main").addObjectw("viewName", "order_detail/ordering.jsp");
//		}
		
		// 결제하기
		@GetMapping("/orderdetail/payment")
		public ModelAndView Payment(String json,Principal principal) throws JsonParseException, JsonMappingException, IOException {
			System.out.println("json=========="+json.getBytes());
			orderService.Ordering(order, artno);
			Order order = objectMapper.readValue(json, new TypeReference<List<Order>>() {});
			return new ModelAndView("main").addObject("viewName", "order_detail/payment.jsp").addObject("order", objectMapper.readValue(json, new TypeReference<List<Order>>() {}));
		}
		
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
}