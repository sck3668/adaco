package com.icia.adaco.service.mvc;

import java.util.*;

import org.apache.jasper.tagplugins.jstl.core.Set;
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
		public void Ordering(String username, Order order,int artno,OrderDto.DtoForOrdering Dto) {
			Order order = modelMapper.map(Dto, Order.class);
			artDao.readByArt(artno);
			orderDao.Ordering(order);
			
		}
	
//		public void Ordering(Order order) {
//			int artno = order.getOrderno();
//			Art art = artDao.readByArt(artno);
//			order.setOrderno(orderno)
//		}

//		
//		// 상품 상세에서 주문
//		public int insertByOrder(Order order,ArtDto.DtoForOrder Dto) {
//			int artno = order.getOrderno();
//			Art art = artDao.findAllByUsername();
//			
//		}
//		
//		public int insertOrder2(Order order, ArtDto.DtoForOrder Dto,String username) {
//			int artno = order.getOrderno();
//			Art art = artDao.findAllByUsername(username);
//			
//		}
		
		// 장바구니에서 주문
		
		// 주문 내역
		public List<OrderDto.DtoForOrdering> BagByOrder(String username,int orderno){
			OrderDto.DtoForOrdering orderdto = new OrderDto.DtoForOrdering();
			List<Order> OrderList = (List<Order>) orderDao.findByOrder(orderno);	
			List<OrderDto.DtoForOrdering> dtolist = new ArrayList<>();
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
//		public void BagByOrder(BagDto.DtoForWrite Dto,Bag bag,  String username, Integer shippingCharge, Order order,ModelMapper modelMapper) {
//			Order order = bagDao.insertByBag(bag);
//			modelMapper.addConverter(order.getOrderno());
//			orderDao.Ordering(order);
//		}
		
		// 장바구니에 담긴 상품 주문하기
//		public void BagByOrder(String username,OrderDto.DtoForOrdering Dto) {
//			Order order = modelMapper.map(Dto,Order.class);
//			Bag bag = modelMapper.map(Dto,Bag.class);
//			orderDao.Ordering(order);
//		}
		// 주문 내역 보기
		public List<Order> findAllByOrder(){
			return orderDao.findAllByOrder();
		}
		
		// 주문 상세 내역 보기
		public void findByOrder(Integer orderno) {
			orderDao.findByOrder(orderno);
		}
}