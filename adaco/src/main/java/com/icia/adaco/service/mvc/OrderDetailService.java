package com.icia.adaco.service.mvc;


import java.time.*;
import java.time.format.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
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
		//System.out.println("orderDto after dto ==="+dto);
		OrderDetail orderDetail = modelMapper.map(dto,OrderDetail.class);
		//System.out.println("orderDetail=="+orderDetail);
		int artno = dto.getArtno();
		//System.out.println("payment-artno==="+artno);
		Art art = artDao.readByArt(artno);
		//System.out.println("art=="+art);
		Option option = optionDao.readByArtno(artno);
		//System.out.println("option=="+option);
		Bag bag = bagDao.findByArtno(artno);
		//System.out.println("bag==="+bag);
		User user = userDao.findByid(username);
		//System.out.println("user====="+user);
		orderDetail.setArtName(art.getArtName()).setAddress(dto.getOriginalAddress());
		orderDetail.setOptionName(option.getOptionName()).setOptionValue(option.getOptionValue());
		orderDetail.setAmount(bag.getAmount()).setPrice(art.getPrice()).setEmail(user.getEmail());
		orderDetail.setAddPoint((int) (art.getPrice()*0.01)).setState(State.답변대기);
		//artName,optionName,optionValue,amount,price,email,tel,
		//request,addPoint,postalcode,refundAccount,isShipping,state,address,recipient,
		//System.out.println("orderDetail11111======"+orderDetail);
		bagDao.deleteByBag(artno);
		//point증가처리
		Point point = Point.builder().startDate(LocalDateTime.now()).endDate(LocalDateTime.now().plusYears(1))
				.username(username).point((int) (bag.getTotalPrice()*0.01)).build();
		userDao.insertpoint(point);
		return orderDetailDao.Payment(orderDetail);
	}
	
	// 주문 상세 보기
	public OrderDto.DtoForAfter OrderDetail(OrderDto.DtoForAfter dto,String username) {
		System.out.println("orderDetail dto==="+dto);
		OrderDto.DtoForAfter afterDto = modelMapper.map(dto,OrderDto.DtoForAfter.class);
		System.out.println("afterDto=="+afterDto);
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
		// artno를 불
			Integer artistno = artistDao.findArtistnoByUsername(username);
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
			List<OrderDetail>orderList = orderDetailDao.FindAllOrderByArtist(srn, ern, artistno);
			List<OrderDto.DtoForList>dtolist=new ArrayList<OrderDto.DtoForList>();
			for(OrderDetail orderdetail:orderList) {
				OrderDto.DtoForList dto = modelMapper.map(orderdetail,OrderDto.DtoForList.class);
//				dto.setOrderDateStr(order.getOrderDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
//			dto.setArtName(artName);
				dtolist.add(dto);
				System.out.println(dto+"주문내역보기");
			}
			page.setOrderList(dtolist);
			
			return page;
			}
	
}