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

}