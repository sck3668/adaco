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
	@Autowired
	private ShopDao shopDao;
	
	// 결제하기
	public int payment(OrderDto.DtoForAfter dto,String username) {
		List<Integer> artnos = dto.getArtnos();
		List<Integer> artistnos = dto.getArtistnos();
//		for(int i=0; i<artnos.size(); i++) {
		OrderDetail orderDetail = modelMapper.map(dto,OrderDetail.class);
		for(int i=0; i<artnos.size(); i++) {
			int artno = artnos.get(i);
//		for(int artno:artnos) {
		Art art = artDao.readByArt(artno);
		Option option = optionDao.readByArtno(artno);
		Bag bag = bagDao.findByArtno(artno);
		User user = userDao.findByid(username);
		System.out.println("user"+user);
		int artistno = artDao.findArtistnoByArtno(artno);
//		for(int artistno:artistnos) {		
			int optno = optionDao.findOptnoByArtno(artno);
			int orderno = orderDao.findOrdernoByUsername(username, bag.getBagno());
			orderDetail.setArtno(artno).setArtistno(artistno)
			.setOptno(optno).setOrderno(orderno);
			
			orderDetail.setArtName(art.getArtName()).setAddress(dto.getOriginalAddress());
			orderDetail.setOptionName(option.getOptionName()).setOptionValue(option.getOptionValue());
			orderDetail.setAmount(bag.getAmount()).setPrice(art.getPrice()+bag.getOptionPrice()).setEmail(user.getEmail());
			orderDetail.setAddPoint((int) (art.getPrice()*0.01)).setOrderstate(orderState.입금대기);
			orderDetail.setOptno(optno);
			bagDao.deleteByBag(artno);
			//point증가처리
//			for(int i=0; i<artnos.size(); i++) {
//			Point point = Point.builder().startDate(LocalDateTime.now().plusSeconds(artnos.get(i))).endDate(LocalDateTime.now().plusYears(1))
//					.username(username).point((int) (bag.getTotalPrice()*0.01)).build();
//			System.out.println("point=="+point);
//			userDao.insertpoint(point);
//			System.out.println("DService payment orderDetail=="+orderDetail);
//			}
//			}
		orderDetailDao.Payment(orderDetail);
		}
		System.out.println("DService payment orderDetail22222=="+orderDetail);
//		}
		return 1;
	}
	
	// 주문 상세 보기
	public OrderDto.DtoForAfter1 OrderDetail(OrderDto.DtoForAfter dto,String username) {
		List<Art> artList = new ArrayList<Art>();
		List<Bag> bagList = new ArrayList<Bag>();
		List<String> requestList = new ArrayList<String>();
		List<Order> orderList = new ArrayList<Order>();
		List<OrderDetail> detailList = new ArrayList<OrderDetail>();
		OrderDto.DtoForAfter1 afterDto = modelMapper.map(dto, OrderDto.DtoForAfter1.class);
//		for(int artno:dto.getArtnos()) {
//			Art art = artDao.readByArt(artno);
//			Bag bag = bagDao.findByArtno(artno);
//			artList.add(art);
//			bagList.add(bag);
//		}
		for(int orderno:dto.getOrdernos()) {
			int artno = orderDetailDao.findByOrdernoOrderDetail(orderno).getArtno();
			Art art = artDao.readByArt(artno);
			Bag bag = bagDao.findByArtno(artno);
			OrderDetail orderDetail = orderDetailDao.OrderDetail(orderno);
			Order order = orderDao.findByOrder(orderno);
			//배열에서 []제거 하고 ","로 잘라서 배열에 추가
			String request1 = orderDetail.getRequest().replace("[", "");
			String request2 = request1.replace("]", "");
			String[] split = request2.split(",");
			String request = "";
			for(int i=0; i<split.length; i++) {
				request = split[i];
				System.out.println("request=="+request);
				requestList.add(request);
			}
			
			artList.add(art);
			bagList.add(bag);
			detailList.add(orderDetail);
			orderList.add(order);
			
			String orderDateStr = order.getOrderDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"));
			afterDto.setOrderDateStr(orderDateStr);
//			afterDto.setArtName(art.getArtName()).setUsername(username)
//			.setOptionName(orderDetail.getOptionName()).setOptionValue(orderDetail.getOptionValue())
//			.setAmount(orderDetail.getAmount()).setPrice(orderDetail.getPrice()).setShippingCharge(order.getShippingCharge())
//			.setAccumulated((int) (afterDto.getPrice()*afterDto.getAmount()*0.01));
			afterDto.setDetailList(detailList).setArtList(artList).setBagList(bagList).setOrderList(orderList);
			afterDto.setRecipient(orderDetail.getRecipient())
					.setAddress(orderDetail.getAddress());
			afterDto.setRequestList(requestList);
		}
		System.out.println("afterDto=="+afterDto);
		return afterDto;
	} 
	
	
	
	/////// 작가 전용 ///////////
	// 주문 내역보기 (작가용)
	public Page OrderListByArtist(int pageno, @Nullable String orderstate,String username) {
			Integer artistno = artistDao.findArtistnoByUsername(username);
//			List<Integer> ordernoList = orderDetailDao.orderFindByArtistno(artistno);
//			for(Integer orderno:ordernoList) {
//				OrderDetail detail = orderDetailDao.OrderDetail(orderno);
//			}
			int countOfBoard = orderDetailDao.countSearchByState(orderstate);
			Page page = PagingUtil.getPage(pageno, countOfBoard);
			int srn = page.getStartRowNum();
			int ern = page.getEndRowNum();
			page.setSearch(orderstate);
			List<OrderDetail> orderList = orderDetailDao.FindAllOrderByArtist(srn, ern, artistno, orderstate);
			List<OrderDto.DtoForList>dtolist=new ArrayList<OrderDto.DtoForList>();
			for(OrderDetail orderdetail:orderList) {
				OrderDto.DtoForList dto = modelMapper.map(orderdetail,OrderDto.DtoForList.class);
				String username1 = orderDao.findUsernameByoderno(dto.getOrderno());
				String orderDate = orderDao.findOrderDateByoderno(dto.getOrderno());
				int shippingCharge = orderDao.findShippingByoderno(dto.getOrderno());
				dto.setUsername(username1).setOrderDateStr(orderDate).setShippingCharge(shippingCharge);
				dto.setOrderstate(orderdetail.getOrderstate());
				dtolist.add(dto);
			}
			page.setOrderList(dtolist);
			return page;
			}
	////
	
	///
	// 주문 상태 업데이트
	public void update(OrderDetailDto.DtoForUpdate dto) {
		OrderDetail orderDetail = orderDetailDao.OrderDetail(dto.getOrderno());
		if(orderDetail == null)
			throw new JobFailException("주문내역이 없습니다.");
		orderDetail = modelMapper.map(dto, OrderDetail.class);
		orderDetailDao.updateByOrderDetail(orderDetail);
	}
	
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
		return orderDto;
	}
}