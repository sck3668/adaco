package com.icia.adaco.service.mvc;

import java.util.*;

import org.junit.jupiter.engine.discovery.predicates.*;
import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;

@Service
public class OrderService {
	
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private BagDao bagDao;
	@Autowired
	private ArtDao artDao;
	private OptionDao optionDao;
	private OrderDetailDao orderDetailDao;
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();
	@Autowired
	private OrderDetailDao orderDDao;
	@Autowired
	private ModelMapper modelMapper;
	
		// 주문 하기    
//		public int Ordering(String username, Order order,OrderDto.DtoForOrdering Dto) {
//			int orderno = order.getOrderno();
//			modelMapper.map(Dto, Order.class);
//			Art art = artDao.readByArt(orderno);
//		//  OrderDto orderdto = OrderDto.DtoForOrdering(order.setOrderno(orderno));
//			return orderDao.Ordering(order);
//			
//		}
		
		// 2
//		public int Ordering(Integer orderno) {
//			Art art = artDao.readByArt(orderno);
//			Option option = optionDao.readByArtno(orderno);
//			OrderDetail orderDetail = orderDetailDao.OrderDetail(orderno);
//			return orderno;
//		}
		// 3
		public int Ordering2(Integer orderno) {
//			Art art = ModelMapper.map(dto, Art.class);
			Art art = artDao.readByArt(orderno);
			Option option = optionDao.readByArtno(orderno);
			OrderDetail orderDetail = orderDetailDao.OrderDetail(orderno);
			OrderDto.DtoForOrdering dto = modelMapper.map(art, OrderDto.DtoForOrdering.class);
			return orderno;
		}
		public void Ordering(Order order) {
			int orderno = order.getOrderno();
			OrderDetail OrderD = orderDDao.OrderDetail(orderno);
		}
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
		
		// 주문 내역
		public List<OrderDto.DtoForOrdering> BagByOrder(String username,int orderno){
			OrderDto.DtoForOrdering orderdto = new OrderDto.DtoForOrdering();
			System.out.println("=======1111");
			List<Order> OrderList = (List<Order>) orderDao.findByOrder(orderno);
			System.out.println("======222");
			List<OrderDto.DtoForOrdering> dtolist = new ArrayList<>();
			System.out.println("===================333");
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
		public void BagByOrder(String username,OrderDto.DtoForOrdering Dto) {
			Order order = modelMapper.map(Dto,Order.class);
			Bag bag = modelMapper.map(Dto,Bag.class);
			orderDao.Ordering(order);
		}
		// 주문 내역 보기
		public List<Order> findAllByOrder(){
			return orderDao.findAllByOrder();
		}
		
		// 주문 상세 내역 보기
		public void findByOrder(Integer orderno) {
			orderDao.findByOrder(orderno);
		}

		public Object Payment(String username, Order order, Integer artno) {
			
			return null;
		}
		
		// 주문 완료 후 장바구니 제거
		
		// 주문알람(유저용)
		
		// 주문-결제하면 이벤트 발생시키는 서비스

}