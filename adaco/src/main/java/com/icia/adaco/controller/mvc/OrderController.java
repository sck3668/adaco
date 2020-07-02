package com.icia.adaco.controller.mvc;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.service.mvc.*;

import oracle.jdbc.proxy.annotation.*;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	//주문 하기
	@GetMapping("/order/ordering")
	public ModelAndView Ordering() {
		return new ModelAndView("main").addObject("viewName","order/ordering.jsp");
	}
	
	// 주문 내역 보기
	@GetMapping("/user/order_list")
	public ModelAndView findAllByOrder() {
		return new ModelAndView("main").addObject("viewName","user/order_list.jsp");
	}

	// 주문 상세 보기
	@GetMapping("/user/order_read")
	public ModelAndView findByOrder() {
		return new ModelAndView("main").addObject("viewName", "user/order_read");
	}
}