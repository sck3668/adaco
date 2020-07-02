package com.icia.adaco.service.rest;

import java.security.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;

@Service
public class OrderDetailRestService {
	
	@Autowired
	private OrderDao orderdao;
	private OrderDetailDao orderDetailDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ModelMapper modelMapper;
	
		
		
		// 주문 하기
		public void OrderWrite(String username,int shippingCharge,Order order) {
			order.setUsername(username);
			order.setShippingCharge(shippingCharge);
			orderdao.insertByOrder(order);
		}
}