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
	@Autowired
	private ArtDao artDao;
	@Autowired
	private OptionDao optionDao;
	@Autowired
	private BagDao bagDao;
	@Autowired
	private UserDao userDao;
	
	// 결제하기
	public int payment(OrderDto.DtoForAfter dto,String username) {
		System.out.println("orderDto after dto ==="+dto);
		OrderDetail orderDetail = modelMapper.map(dto,OrderDetail.class);
		System.out.println("orderDetail=="+orderDetail);
		int artno = dto.getArtno();
		System.out.println("payment-artno==="+artno);
		Art art = artDao.readByArt(artno);
		System.out.println("art=="+art);
		Option option = optionDao.readByArtno(artno);
		System.out.println("option=="+option);
		Bag bag = bagDao.findByArtno(artno);
		System.out.println("bag==="+bag);
		User user = userDao.findByid(username);
		System.out.println("user====="+user);
		orderDetail.setArtName(art.getArtName()).setAddress(dto.getOriginalAddress());
		orderDetail.setOptionName(option.getOptionName()).setOptionValue(option.getOptionValue());
		orderDetail.setAmount(bag.getAmount()).setPrice(art.getPrice()).setEmail(user.getEmail());
		orderDetail.setAddPoint((int) (art.getPrice()*0.01)).setState(State.답변대기);
		//artName,optionName,optionValue,amount,price,email,tel,
		//request,addPoint,postalcode,refundAccount,isShipping,state,address,recipient,
		System.out.println("orderDetail11111======"+orderDetail);
		
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
}