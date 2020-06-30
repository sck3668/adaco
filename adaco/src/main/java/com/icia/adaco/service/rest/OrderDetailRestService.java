package com.icia.adaco.service.rest;

import java.security.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;

@Service
public class OrderDetailRestService {
	
	@Autowired
	private OrderDetailDao orderDetailDao;
	@Autowired
	private ModelMapper modelMapper;
	// 주문 취소
		public void OrderDelete(Principal principal, Integer orderno) {
			OrderDetail orderdetail = orderDetailDao.deleteByOrderDetail(orderno);
			if(orderdetail==null)
				throw new OrderDetailNotFoundException();
			if(orderdetail.get)
			
			
			return null;
		}
}
