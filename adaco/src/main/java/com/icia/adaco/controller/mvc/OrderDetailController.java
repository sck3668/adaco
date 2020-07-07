package com.icia.adaco.controller.mvc;


import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.service.mvc.*;

@Controller
public class OrderDetailController {

		@Autowired
		private OrderDetailService service;
		
//		@GetMapping("/orderdetail/overview")
//		public ModelAndView OrderDetail(Principal principal,Model model, @RequestParam(vla)) {
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
		
		// 주문 내역 상세 
		@GetMapping("/orderdetail/orderdetail")
		public ModelAndView orderDetail( ) {
			return new ModelAndView("main").addObject("viewName", "order_detail/orderdetail.jsp");
		}
		
}