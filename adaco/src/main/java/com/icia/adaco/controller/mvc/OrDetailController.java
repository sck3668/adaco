package com.icia.adaco.controller.mvc;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class OrDetailController {

		@GetMapping("/orderdetail/overview")
		public ModelAndView OrderDetail() {
			return new ModelAndView("main").addObject("viewName", "order_detail/orverview.jsp");
		}
		
		@GetMapping("/orderdetail/orderrequest")
		public ModelAndView orderRequest(HttpSession session) {
			return new ModelAndView("main").addObject("viewName", "order_detail/request.jsp");
		}
}