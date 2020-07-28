package com.icia.adaco.service.mvc;

import java.time.format.*;
import java.time.*;
import java.util.*;

import javax.servlet.http.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.scheduling.quartz.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;

import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.OrderDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.util.*;

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

	//주문하기
	public int Ordering(Order order, Bag bag) {
		int artno = bag.getArtno();
		Art art = artDao.readByArt(artno);
		bag.setTotalPrice(bag.getAmount() * art.getPrice());
		return orderDao.Ordering(order);
	}
//사용안함
	// 결제하기
	@PreAuthorize("isAuthenticated()")
	public int payment(String username, OrderDto.DtoForOrdering dto) {
		System.out.println("DtoForOrdering==="+dto);
		OrderDetail orderdetail = modelMapper.map(dto, OrderDetail.class);
		System.out.println("orderdetail=="+orderdetail);
		orderDetailDao.Payment(orderdetail);
		return orderdetail.getOrderno();
	}

	// 아트상세에서 주문하기
	public int Ordering(Order order,Bag bag,String username) {
		int artno = bag.getArtno();
		Art art = artDao.readByArt(artno);

		order.setOrderDate(LocalDateTime.now());
		order.setUsername(username);
		order.setShippingCharge(art.getCouriPrice());
				bag.setTotalPrice(bag.getAmount()*art.getPrice());
		bagDao.insertByBag(bag);
		int bagno = bagDao.findByArtno(artno).getBagno();
		order.setBagno(bagno);
		orderDao.Ordering(order);
		System.out.println(artno+"artno111");
		return artno;
	}
	//장바구니에서 주문하기
	public Map<String, Object> bagOrdering(List<Integer> list,String username) {
		OrderDto.DtoForOrdernos dto = new OrderDto.DtoForOrdernos();
		Order order = new Order();
		order.setOrderDate(LocalDateTime.now());
		order.setUsername(username);
//		order.setShippingCharge(3000);
		List<Integer> list1 = new ArrayList<Integer>();
		int bagno = 0;
		for(int i=0; i<list.size(); i++) {
			bagno = bagDao.findByArtno(list.get(i)).getBagno();
			Art art = artDao.readByArt(list.get(i));
			order.setBagno(bagno);
			order.setShippingCharge(art.getCouriPrice());
			orderDao.Ordering(order);
			int orderno = orderDao.findOrdernoByUsername(username, bagDao.findByArtno(list.get(i)).getBagno());
			list1.add(orderno);
		}
		//orderno로 장바구니 번호를 찾아서 목록을 출력
		List<String> listStr = new ArrayList<String>();
		for(Integer listIt:list1) {
			String ordernosStr = Integer.toString(listIt);
			listStr.add(ordernosStr);
		}
		Map<String,Object> map = new HashMap<String, Object>();
		for(String str:listStr) {
			for(int i=0; i<listStr.size(); i++) {
				map.put("str"+i,listStr.get(i));
			}
		}
		return map;
	}
	
	// 주문하기 후 결제창 이동시 넘겨줄 데이터
	public OrderDto.DtoForPayment OrderingD(String username,int artno) {
		OrderDto.DtoForPayment dto = new OrderDto.DtoForPayment();
		List<Art> artList = new ArrayList<Art>();
		List<Bag> bagList = new ArrayList<Bag>();
		List<String> writerList = new ArrayList<String>();
		List<Integer> ordernoList = new ArrayList<Integer>();
		Art art = artDao.readByArt(artno);
		int artistno = artDao.findArtistnoByArtno(artno);
		int optno = optionDao.findOptnoByArtno(artno);
		//수정
		int bagno = bagDao.findByArtno(artno).getBagno();
		int orderno = orderDao.findOrdernoByUsername(username,bagno);
		Option option = optionDao.readByArtno(artno);
		User user = userDao.findByid(username);
		Bag bag = bagDao.findByArtno(artno);
		String writer = artistDao.findByid(artistno).getUsername();
		String artistUsername = artistDao.findByid(artistno).getUsername();
		String artistName = userDao.findByid(artistUsername).getIrum();
		artList.add(art);
		bagList.add(bag);
		ordernoList.add(orderno);
		writerList.add(writer);
		dto.setArtistName(artistName).setOption(option).setUser(user).setBag(bag).setArtistno(artistno);
		dto.setOrdernoList(ordernoList).setArtList(artList).setBagList(bagList).setWriterList(writerList);
		return dto;
	}
	
	// 장바구니에서 주문하기 후 결제창 이동시 넘겨줄 데이터
	public DtoForPayment bagOrderingD(String username,String ordernos) {
		List<Integer> list = new ArrayList<Integer>();
		int one = ordernos.indexOf(",");
		String[] split = ordernos.split(",");
		int idx = ordernos.indexOf(":")+2;
		int Lidx = 0;
		for (int i = 0; i < split.length; i++) {
			idx = split[i].indexOf(":")+2;
			Lidx = split[i].lastIndexOf('"');
			list.add(Integer.parseInt(split[i].substring(idx,Lidx)));
		}
		if(one==-1) {
			OrderDto.DtoForPayment dto = new OrderDto.DtoForPayment();
			List<Art> artList = new ArrayList<Art>();
			List<Bag> bagList = new ArrayList<Bag>();
			List<String> writerList = new ArrayList<String>();
			List<Integer> ordernoList = new ArrayList<Integer>();
			for(int orderno:list) {
				List<Integer> bagnoList = orderDao.findBagnoByOrderno(orderno);
				for(int bagno1:bagnoList) {
					int artno = bagDao.findArtnoByBagno(bagno1);
					Art art = artDao.readByArt(artno);
					int artistno = artDao.findArtistnoByArtno(artno);
					
					String writer = artistDao.findByid(artistno).getUsername();
					//수정
					Option option = optionDao.readByArtno(artno);
					User user = userDao.findByid(username);
					Bag bag = bagDao.findByArtno(artno);
					String artistUsername = artistDao.findByid(artistno).getUsername();
					String artistName = userDao.findByid(artistUsername).getIrum();
					dto.setArtistName(artistName).setOption(option).setUser(user).setArtistno(artistno);
					artList.add(art);
					bagList.add(bag);
					ordernoList.add(orderno);
					writerList.add(writer);
					
				}
				dto.setOrdernoList(ordernoList).setArtList(artList).setBagList(bagList).setWriterList(writerList);
			}
			return dto;
		} else {
			OrderDto.DtoForPayment dto = new OrderDto.DtoForPayment();
			List<Art> artList = new ArrayList<Art>();
			List<Bag> bagList = new ArrayList<Bag>();
			List<String> writerList = new ArrayList<String>();
			List<Integer> ordernoList = new ArrayList<Integer>();
			for(int orderno:list) {
				List<Integer> bagnoList = orderDao.findBagnoByOrderno(orderno);
				for(int bagno1:bagnoList) {
					int artno = bagDao.findArtnoByBagno(bagno1);
					Art art = artDao.readByArt(artno);
					int artistno = artDao.findArtistnoByArtno(artno);
					//수정
					String writer = artistDao.findByid(artistno).getUsername();
					Option option = optionDao.readByArtno(artno);
					User user = userDao.findByid(username);
					Bag bag = bagDao.findByArtno(artno);
					String artistUsername = artistDao.findByid(artistno).getUsername();
					String artistName = userDao.findByid(artistUsername).getIrum();
					dto.setArtistName(artistName).setOption(option).setUser(user).setArtistno(artistno);
					artList.add(art);
					bagList.add(bag);
					ordernoList.add(orderno);
					writerList.add(writer);
				}
				dto.setOrdernoList(ordernoList).setArtList(artList).setBagList(bagList).setWriterList(writerList);
			}
			return dto;
		}
	}
	
	//결제창에서 취소 클릭 시 주문 취소
	public boolean delete(String ordernos,String username) {
		List<Integer> list = new ArrayList<Integer>();
		int one = ordernos.indexOf(",");
		String ordernos1 = ordernos.replace("[", "");
		String ordernos2 = ordernos1.replace("]", "");
		String[] split = ordernos2.split(",");
		for (int i = 0; i < split.length; i++) {
			System.out.println(split[i]+"@@@");
			list.add(Integer.parseInt(split[i].substring(0)));
		}
		if(one==-1) {
			for(int orderno:list) {
				orderDao.deleteByOrder(orderno);
			}
			return true;
		} else {
			for(int orderno:list) {
				orderDao.deleteByOrder(orderno);
			}
			return true;
		}
	}
}