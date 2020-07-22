package com.icia.adaco.service.mvc;


import java.time.*;
import java.time.format.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.lang.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.util.*;

@Service
public class OrderDetailService {
	@Autowired
	private OrderDetailDao orderDetailDao; 
	@Autowired
	private ModelMapper modelMapper; 
	@Autowired
	private ArtDao artDao;
	@Autowired
	private OptionDao optionDao;
	@Autowired
	private BagDao bagDao;
	@Autowired
	private UserDao userDao;
	@Autowired 
	private OrderDao orderDao;
	@Autowired
	private ArtistDao artistDao;
	
	
	// 결제하기
	public int payment(OrderDto.DtoForAfter dto,String username) {
		OrderDetail orderDetail = modelMapper.map(dto,OrderDetail.class);
		int artno = dto.getArtno();
		Art art = artDao.readByArt(artno);
		Option option = optionDao.readByArtno(artno);
		Bag bag = bagDao.findByArtno(artno);
		User user = userDao.findByid(username);
		orderDetail.setArtName(art.getArtName()).setAddress(dto.getOriginalAddress());
		orderDetail.setOptionName(option.getOptionName()).setOptionValue(option.getOptionValue());
		orderDetail.setAmount(bag.getAmount()).setPrice(art.getPrice()).setEmail(user.getEmail());
		orderDetail.setAddPoint((int) (art.getPrice()*0.01)).setOrderstate(orderState.입금대기);
		//artName,optionName,optionValue,amount,price,email,tel,
		//request,addPoint,postalcode,refundAccount,isShipping,state,address,recipient,
		//System.out.println("orderDetail11111======"+orderDetail);
		bagDao.deleteByBag(artno);
		//point증가처리
		Point point = Point.builder().startDate(LocalDateTime.now()).endDate(LocalDateTime.now().plusYears(1))
				.username(username).point((int) (bag.getTotalPrice()*0.01)).build();
		userDao.insertpoint(point);
		System.out.println("orderDetail1111111111111"+orderDetail);
		return orderDetailDao.Payment(orderDetail);
	}
	
	// 주문 상세 보기
	public OrderDto.DtoForAfter OrderDetail(OrderDto.DtoForAfter dto,String username) {
		System.out.println("orderDetail dto===" + dto);
		
		Art art = artDao.readByArt(dto.getArtno());
		Order order = orderDao.findByOrder(dto.getOrderno());
		Bag bag = bagDao.findByArtno(dto.getArtno());
		OrderDetail orderDetail = orderDetailDao.OrderDetail(dto.getOrderno());
		System.out.println("OrderDetail@@!@#!@@========"+orderDetail);
		OrderDto.DtoForAfter afterDto = modelMapper.map(dto, OrderDto.DtoForAfter.class);
		String orderDateStr = order.getOrderDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"));
		afterDto.setOrderDateStr(orderDateStr).setArtName(art.getArtName()).setUsername(username)
//		.setPostalcode(orderDetail.getPostalcode())
		.setOptionName(orderDetail.getOptionName()).setOptionValue(orderDetail.getOptionValue())
		.setAmount(orderDetail.getAmount()).setPrice(orderDetail.getPrice()).setShippingCharge(order.getShippingCharge());
		System.out.println("afterDto==" + afterDto);
		return afterDto;
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
	
	/////// 작가 전용 ///////////
	// 주문 내역보기 (작가용)
	public Page OrderListByArtist(int pageno, String username) {
			Integer artistno = artistDao.findArtistnoByUsername(username);
//			Integer orderno = orderDao.findOrdernoByUsername(username, bagno);
//			List<Integer> artnos = artDao.findArtnoByArtistno(artistno);
//			List<String> artnames = new ArrayList<String>();
//			for(int artno:artnos) {
//				String artname = artDao.readByArt(artno).getArtName();
//				artnames.add(artname);
//			}
			List<Integer>ordernoList = orderDetailDao.orderFindByArtistno(artistno);
			for(Integer orderno:ordernoList) {
				OrderDetail detail = orderDetailDao.OrderDetail(orderno);
			}
			int countOfBoard = orderDetailDao.countByOrder();
			Page page = PagingUtil.getPage(pageno, countOfBoard);
			int srn = page.getStartRowNum();
			int ern = page.getEndRowNum();
			List<OrderDetail> orderList = orderDetailDao.FindAllOrderByArtist(srn, ern, artistno);
			List<OrderDto.DtoForList>dtolist=new ArrayList<OrderDto.DtoForList>();
			for(OrderDetail orderdetail:orderList) {
				OrderDto.DtoForList dto = modelMapper.map(orderdetail,OrderDto.DtoForList.class);
				String username1 = orderDao.findUsernameByoderno(dto.getOrderno());
				String orderDate = orderDao.findOrderDateByoderno(dto.getOrderno());
				int shippingCharge = orderDao.findShippingByoderno(dto.getOrderno());
				dto.setUsername(username1).setOrderDateStr(orderDate).setShippingCharge(shippingCharge);
				dto.setOrderstate(orderdetail.getOrderstate());
				dtolist.add(dto);
//				System.out.println(dto+"주문내역보기");
			}
			page.setOrderList(dtolist);
			
			return page;
			}
	
	
	// 주문 상태 업데이트
	public void update(OrderDetailDto.DtoForUpdate dto) {
		OrderDetail orderDetail = orderDetailDao.OrderDetail(dto.getOrderno());
//		Integer artistno = artistDao.findArtistnoByUsername(username);
		if(orderDetail == null)
			throw new JobFailException("주문내역이 없습니다.");
//		if(artistno.equals(dto.getArtistno())==false)
//			throw new IllegalJobException();
		orderDetail = modelMapper.map(dto, OrderDetail.class);
		orderDetailDao.updateByOrderDetail(orderDetail);
	}
	
	// 고객 주문 상세보기(작가용)
	
	// 주문 상세 보기
	public OrderDetailDto.DtoForReadOrder OrderDetailByArtist(Integer orderno, String username) {
		OrderDetail orderDetail = orderDetailDao.OrderDetail(orderno);
		OrderDetailDto.DtoForReadOrder orderDto = modelMapper.map(orderDetail,OrderDetailDto.DtoForReadOrder.class);
		Integer artistno = artistDao.findArtistnoByUsername(username);
		if(artistno.equals(orderDto.getArtistno())==false)
			throw new IllegalJobException();
		//username1은 주문한 고객 아이디
		String username1 = orderDao.findUsernameByoderno(orderDto.getOrderno());
		String orderDate = orderDao.findOrderDateByoderno(orderDto.getOrderno());
		int shippingCharge = orderDao.findShippingByoderno(orderDto.getOrderno());
		String irum = userDao.irumByUsername(username1);
		orderDto.setUsername(username1).setOrderDateStr(orderDate).setShippingCharge(shippingCharge).setOrderstate(orderDetail.getOrderstate()).setIrum(irum);
		//System.out.println(orderDto+"44444444444");
		return orderDto;
	}
	
}