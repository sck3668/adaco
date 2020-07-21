package com.icia.adaco.controller.rest;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.icia.adaco.service.rest.*;

@Controller
public class OrderRestController {
	
	@Autowired
	private OrderRestService orderservice;
	
	// 주문 취소
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/user/order_list")
	public ResponseEntity<?> OrderDelete(Principal principal, Integer orderno){
		orderservice.DeleteByOrder(principal,orderno);
		return ResponseEntity.ok("/user/order_list");
	}
}
