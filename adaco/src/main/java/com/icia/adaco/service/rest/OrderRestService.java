package com.icia.adaco.service.rest;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;

@Service
public class OrderRestService {
	
	@Autowired
	private OrderDao orderDao;
	
	// 주문 취소
		public void DeleteByOrder(Principal principal,Integer orderno  ) {
			Order order = orderDao.findByOrder(orderno);
			if(order==null)
				throw new OrderNotFoundException();
			if(order.getUsername().equals(principal.getName())==true) {
				throw new OrderJobFailException("주문이 취소 되었습니다");
			}
//			if(username.equals(principal)==true) {
//				throw new OrderJobFailException("주문이 취소 되었습니다");
//				}
}
		// 주문취소2 
//		public void DeleteByOrder(Integer orderno) {
//			orderDao.deleteByOrder(orderno);
//		}
		
}