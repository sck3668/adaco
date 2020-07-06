package com.icia.adaco.service.mvc;

import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;

@Service
public class OrderService {
	
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private UserDao userDao;
	private BagDao bagDao;
	private ArtDao artDao;
	@Autowired
	private ModelMapper modelMapper;
	
		// 주문 하기    
		public void Ordering(Order order,int artno) {
			artDao.readByArt(artno);
			orderDao.Ordering(order);
			
		}
		
		public List<OrderDetailDto.DtoForDeleteOrderDetail> payment(){
			
		}
		
		// 장바구니에 담긴 상품 주문하기
		public void BagOrder(BagDto.DtoForWrite Dto,Bag bag,  String username, Integer shippingCharge, Order order) {
			bagDao.insertByBag(bag);
		}
		
		
		// 주문 내역 보기
		public List<Order> findAllByOrder(){
			return orderDao.findAllByOrder();
		}
		
		// 주문 상세 내역 보기
		public void findByOrder(Integer orderno) {
			orderDao.findByOrder(orderno);
		}

		public void Ordering(String username, Integer shippingCharge, Order order) {
			// TODO Auto-generated method stub
			
		}

		public void Ordering(String username, Integer shippingCharge, Order order) {
			// TODO Auto-generated method stub
			
		}
}