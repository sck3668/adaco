package com.icia.adaco.service.mvc;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
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
	
	// 주문하기
	public int Ordering(OrderDetailDto.DtoForOrdering dto) {
		OrderDetail orderdetail = modelMapper.map(dto, OrderDetail.class);
		orderDetailDao.insertByOrderDetail(orderdetail);
		return orderdetail.getOrderno();
	}
		
	
	// 모든 주문 내역 보기
	
	// 주문 상세 내역
}
