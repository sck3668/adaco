package com.icia.adaco.service.mvc;

import java.time.*;
import java.util.*;

import javax.servlet.http.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.scheduling.quartz.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;import com.icia.adaco.exception.*;

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
	@Autowired
	private OptionDao optionDao;
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	private OrderDetailDao orderDetailDao;
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();
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
		
	
	
	// 아트상세에서 주문하기
			public int Ordering(Order order,Bag bag,String username) {
				System.out.println("ordering service"+order+"//"+bag+"//"+username);
				order.setOrderDate(LocalDateTime.now());
				order.setUsername(username);
				order.setShippingCharge(3000);
				int artno = bag.getArtno();
				Art art = artDao.readByArt(artno);
				bag.setTotalPrice(bag.getAmount()*art.getPrice());
				bagDao.insertByBag(bag);
				int bagno = bagDao.findByArtno(artno).getBagno();
				order.setBagno(bagno);
				orderDao.Ordering(order);
				System.out.println(artno+"artno111");
				return artno;
			}
		//장바구니에서 주문하기
			public int bagOrdering(Order order,Bag bag,String username) {
				System.out.println("ordering service"+order+"//"+bag+"//"+username);
				order.setOrderDate(LocalDateTime.now());
				order.setUsername(username);
				order.setShippingCharge(3000);
				int artno = bag.getArtno();
				Art art = artDao.readByArt(artno);
				bag.setTotalPrice(bag.getAmount()*art.getPrice());
				System.out.println("bag1111==="+bag);
				//bagDao.insertByBag(bag);
				int bagno = bagDao.findByArtno(artno).getBagno();
				order.setBagno(bagno);
				System.out.println("order======"+order);
				orderDao.Ordering(order);
				System.out.println(artno+"artno111");
				return artno;
			}
			
			
			// 주문하기 후 결제창 이동시 넘겨줄 데이터
			public OrderDto.DtoForPayment OrderingD(String username,int artno) {
				Art art = artDao.readByArt(artno);
				int artistno = artDao.findArtistnoByArtno(artno);
				System.out.println("333");
				int optno = optionDao.findOptnoByArtno(artno);
				System.out.println("4444");
				//수정
				int bagno = bagDao.findByArtno(artno).getBagno();
				int orderno = orderDao.findOrdernoByUsername(username,bagno);
				System.out.println("orderingD1==="+artistno+"//"+optno+"//"+orderno);
				Option option = optionDao.readByArtno(artno);
				System.out.println("option==="+option);
				User user = userDao.findByid(username);
				System.out.println("user====="+user);
				System.out.println("art===="+art);
				Bag bag = bagDao.findByArtno(artno);
				System.out.println("bag===="+bag);
				String artistUsername = artistDao.findByid(artistno).getUsername();
				String artistName = userDao.findByid(artistUsername).getIrum();
				OrderDto.DtoForPayment dto = new OrderDto.DtoForPayment();
				dto.setArtistName(artistName).setArt(art).setOption(option).setUser(user).setBag(bag).setArtistno(artistno).setOrderno(orderno);
				System.out.println("orderingD  Dto ==="+dto);
				return dto;
			}
	
	
	
	
	
	////////////////////////////////
//		public int Ordering(Order order,Bag bag) {
//			int artno = bag.getArtno();
//			Art art = artDao.readByArt(artno);
//			bag.setTotalPrice(bag.getAmount()*art.getPrice());
//			return orderDao.Ordering(order);
//		}
		
		// 결제하기
//		@PreAuthorize("isAuthenticated()")
//		public int payment(String username,OrderDto.DtoForOrdering dto) {
//			System.out.println(dto+"=============dto");
//			OrderDetail orderdetail = modelMapper.map(dto, OrderDetail.class);
//			System.out.println(orderdetail+"===============orderdetail");
//			orderDetailDao.Payment(orderdetail);
//			if()
//		return orderdetail.getOrderno();
//		}
//		
//		public int payByOrder(String username, OrderDetailDto.DtoForDeleteOrder Dto, Order order){
//			int orderdetail = orderDao.Ordering(order);
//			if(order.getUsername()===false);
//				orderDao.Ordering(order);
//			return order.getOrderno(); 
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
//			List<Option> option = option
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

		// 주문 완료 후 장바구니에 담긴 상품 제거
		public int RemoveCartByOrder(String  username,Integer artno,Integer orderno) {	
			Bag bag = bagDao.findByArtno(artno);
			Order order = orderDao.findByOrder(orderno);
//			if(order.getUsername()==true);
				bagDao.deleteByBag(artno);
			return artno;
			
		}
		// 주문알람(유저용)
		
		// 주문-결제하면 이벤트 발생시키는 서비스

}