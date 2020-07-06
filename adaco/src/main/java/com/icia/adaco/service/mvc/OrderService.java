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
		public void insertByOrder(String username, Integer shippingCharge, Order order,int artno) {
			artDao.readByArt(artno);
			orderDao.Ordering(order);
			
		}
		
		// 상품 상세에서 주문
		public int insertByOrder(Order order,ArtDto.DtoForOrder Dto) {
			int artno = order.getOrderno();
			Art art = artDao.findAllByUsername();
			
		}
		
		public int insertOrder2(Order order, ArtDto.DtoForOrder Dto,String username) {
			int artno = order.getOrderno();
			Art art = artDao.findAllByUsername(username);
			
		}
		
		// 장바구니에서 주문
		
		// 주문 내역
		public List<OrderDetailDto.DtoForOrdering> BagByOrder(String username,int orderno){
			OrderDetailDto.DtoForOrdering orderdto = new OrderDetailDto.DtoForOrdering();
			List<Order> OrderList = (List<Order>) orderDao.findByOrder(orderno);	
			List<OrderDetailDto.DtoForOrdering> dtolist = new ArrayList<>();
		for(Order order:OrderList) {
//			int orderno = order.getOrderno();
//			Order order = orderDao.findByOrder(orderno);
//			Art art = artDao.readByArt(artno);
//			List<Option> option = optio]
//			OrderDetailDto.DtoForOrdering dtoorder = modelMapper.map(oorderno,OrderDetailDto.DtoForOrderin.classg);
//			dtoOrder.setArt(art);
//			dtoOrder.setOption(option);
//			dtoList.add(dtoOrder);
		}
		return dtolist;
				
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

}