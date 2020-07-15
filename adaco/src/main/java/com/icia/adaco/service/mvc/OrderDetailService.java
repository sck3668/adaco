package com.icia.adaco.service.mvc;


import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;

@Service
public class OrderDetailService {
	@Autowired
	private OrderDetailDao orderDetailDao; 
	@Autowired
	private ModelMapper modelMapper; 
	
	// 주문 상세 보기
	public OrderDetail OrderDetail(Integer orderno) {
		return orderDetailDao.OrderDetail(orderno);
	}
	

	public int payment(OrderDetail orderDetail) {
		return orderDetailDao.Payment(orderDetail);
	}

	
	
	// 모든 주문 내역 보기
	
//	public void orderlist(Principal principal, String username, Integer orderno) {
//		OrderDetail orderdetail = ModelMapper.map(Dto, OrderDetail.class);
//	}
//	public List<OrderDetail> findAllByOrderDetail(){
//
//		return orderDetailDao.OrderByAll(startRowNum, endRowNum);
//		
//	}
}