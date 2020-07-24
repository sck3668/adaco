package com.icia.adaco.service.rest;

import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;

@Service
public class OrderRestService {
	@Autowired
	private OrderDao orderDao;
	
	// 주문 취소
	@DeleteMapping("/order/delete")
	public void DeleteByOrder(Principal principal,Integer orderno,String username,Integer optno) {
		Order order = orderDao.findByOrder(orderno);
		if(order==null)
			throw new OrderNotFoundException();
		if(order.getUsername().equals(principal.getName())==true) {
			throw new OrderJobFailException("주문이 취소 되었습니다");
		}
}
	// 주문
	@DeleteMapping("/order/ordering")
	public String delete(Integer orderno) {
		orderDao.deleteByOrder(orderno);
		return "rediredt:/adaco";
	}
		
}