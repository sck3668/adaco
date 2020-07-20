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

	// 결제하기
	@PreAuthorize("isAuthenticated()")
	public int payment(String username, OrderDto.DtoForOrdering dto) {
		System.out.println(dto + "=============dto");
		OrderDetail orderdetail = modelMapper.map(dto, OrderDetail.class);
		System.out.println(orderdetail + "===============orderdetail");
		orderDetailDao.Payment(orderdetail);
		return orderdetail.getOrderno();
	}

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
	public Map<String, Object> bagOrdering(List<Integer> list,String username) {
		//list값은 artno
		OrderDto.DtoForOrdernos dto = new OrderDto.DtoForOrdernos();
		System.out.println("bagordering list=="+list);
		Order order = new Order();
		order.setOrderDate(LocalDateTime.now());
		order.setUsername(username);
		order.setShippingCharge(3000);
		List<Integer> list1 = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++) {
			int bagno = bagDao.findByArtno(list.get(i)).getBagno();
			order.setBagno(bagno);
			System.out.println("for==bagno=="+bagno);
			System.out.println("for==order=="+order);
			orderDao.Ordering(order);
			int orderno = orderDao.findOrdernoByUsername(username, order.getBagno());
			list1.add(orderno);
			
		}
		//List<Integer> ordernos = orderDao.findOrdernoByUsername(username, order.getBagno());
		//list.add(orderno);
		System.out.println("order==="+order);
		
		//System.out.println("bagOrdering orderno==="+orderno);
		//orderno로 장바구니 번호를 찾아서 목록을 출력
		System.out.println("list1===="+list1);
		List<String> listStr = new ArrayList<String>();
		for(Integer listIt:list1) {
			String ordernosStr = Integer.toString(listIt);
			listStr.add(ordernosStr);
			//dto.setOrdernos(ordernosStr);
		}
		System.out.println("listStr=="+listStr);
		System.out.println("dto==="+dto);
		System.out.println("dto1111="+dto);
		Map<String,Object> map = new HashMap<String, Object>();
		for(String str:listStr) {
			for(int i=0; i<listStr.size(); i++) {
				map.put("str"+i,listStr.get(i));
				//map.put("STR",listStr.get(i++));
			}
			
		}
		System.out.println("map======="+map);
		return map;
	}
	
	
	// 주문하기 후 결제창 이동시 넘겨줄 데이터
	public OrderDto.DtoForPayment OrderingD(String username,int artno) {
		Art art = artDao.readByArt(artno);
		int artistno = artDao.findArtistnoByArtno(artno);
		int optno = optionDao.findOptnoByArtno(artno);
		//수정
		int bagno = bagDao.findByArtno(artno).getBagno();
		int orderno = orderDao.findOrdernoByUsername(username,bagno);
		Option option = optionDao.readByArtno(artno);
		User user = userDao.findByid(username);
		Bag bag = bagDao.findByArtno(artno);
		String artistUsername = artistDao.findByid(artistno).getUsername();
		String artistName = userDao.findByid(artistUsername).getIrum();
		OrderDto.DtoForPayment dto = new OrderDto.DtoForPayment();
		List<Art> artList = new ArrayList<Art>();
		artList.add(art);
		dto.setArtistName(artistName).setOption(option).setUser(user).setBag(bag).setArtistno(artistno).setOrderno(orderno);
		dto.setArtList(artList);
		return dto;
	}
	
	// 장바구니에서 주문하기 후 결제창 이동시 넘겨줄 데이터
	public DtoForPayment bagOrderingD(String username,String ordernos) {
		//{"str1":"462","str0":"461"}
	//	System.out.println(ordernos.substring(9,12));
	//	System.out.println(ordernos.substring(22,25));
		System.out.println("======");
		int orderno1 = Integer.parseInt(ordernos.substring(9,12));
		int orderno2 = Integer.parseInt(ordernos.substring(22,25));
	//	System.out.println("paymentOrderno==="+orderno1);
	//	System.out.println("==="+orderno2);
	//	int orderno = 0;
		List<Integer> list = new ArrayList<Integer>();
		list.add(orderno1);
		list.add(orderno2);
		OrderDto.DtoForPayment dto = new OrderDto.DtoForPayment();
		System.out.println("list=="+list);
		List<Art> artList = new ArrayList<Art>();
		for(int orderno:list) {
		//Order order1 = orderDao.findByOrder(orderno);
		List<Integer> bagnoList = orderDao.findBagnoByOrderno(orderno);
		System.out.println("bagnoList==="+bagnoList);
		for(int bagno1:bagnoList) {
			int artno = bagDao.findArtnoByBagno(bagno1);
			Art art = artDao.readByArt(artno);
			int artistno = artDao.findArtistnoByArtno(artno);
		//int optno = optionDao.findOptnoByArtno(artno);
		//수정
		//int bagno = bagDao.findByArtno(artno).getBagno();
		//int orderno = orderDao.findOrdernoByUsername(username,bagno);
			Option option = optionDao.readByArtno(artno);
			User user = userDao.findByid(username);
			Bag bag = bagDao.findByArtno(artno);
			String artistUsername = artistDao.findByid(artistno).getUsername();
			String artistName = userDao.findByid(artistUsername).getIrum();
			dto.setArtistName(artistName).setOption(option).setUser(user).setBag(bag).setArtistno(artistno).setOrderno(orderno);
			System.out.println("art==="+art);
			artList.add(art);
			dto.setLastPrice(art.getPrice()+bag.getOptionPrice()+art.getCouriPrice());
		}
		System.out.println("artList=="+artList);
		dto.setArtList(artList);
		}
		System.out.println("lastDto=="+dto);
		return dto;
		
	}
	
	////////////////////////////////
	// 주문 내역
	public List<OrderDto.DtoForOrdering> BagByOrder(String username, int orderno) {
		OrderDto.DtoForOrdering orderdto = new OrderDto.DtoForOrdering();
		System.out.println("=======1111");
		List<Order> OrderList = (List<Order>) orderDao.findByOrder(orderno);
		System.out.println("======222");
		List<OrderDto.DtoForOrdering> dtolist = new ArrayList<>();
		System.out.println("===================333");
		for (Order order : OrderList) {
		}
		return dtolist;

	}

	// 주문 내역 보기
	public Page OrderList(int pageno, String username) {
		// artno를 불
			List<Integer>ordernoList = orderDao.orderFindByUsername(username);
			System.out.println(ordernoList+"오더리스트");
			for(Integer orderno:ordernoList) {
				OrderDetail detail = orderDetailDao.OrderDetail(orderno);
				System.out.println(detail+"디테일");
			}
			
			int countOfBoard = orderDao.count(username);
			Page page = PagingUtil.getPage(pageno, countOfBoard);
			int srn = page.getStartRowNum();
			int ern = page.getEndRowNum();
			List<Order>orderList = orderDao.findAllByOrder(srn, ern, username);
			List<OrderDto.DtoForList>dtolist=new ArrayList<OrderDto.DtoForList>();
			for(Order order:orderList) {
				OrderDto.DtoForList dto = modelMapper.map(order,OrderDto.DtoForList.class);
				dto.setOrderDateStr(order.getOrderDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
				dtolist.add(dto);
			}
			page.setOrderList(dtolist);
			return page;

		/*
		 * List<Integer> ordernoList = orderDao.orderFindByUsername(username);
		 * System.out.println("=========="+ordernoList); List<Bag> bagList =
		 * orderDao.BagFindUsernameArtno(username); System.out.println(bagList+"백백");
		 * for(Bag artno:bagList) { Art art = artDao.readByArt(artno.getArtno());
		 * session.setAttribute("artName",art.getArtName());
		 * session.setAttribute("artPrice",art.getPrice()); }
		 * 
		 * for(int orderno:ordernoList) { System.out.println(orderno+"오더엔오");
		 * OrderDetail detail = orderDetailDao.OrderDetail(orderno);
		 * System.out.println(detail+"디테일"); String artName = detail.getArtname();
		 * detail1.setArtname(artName); int price = detail.getPrice();
		 * detail1.setPrice(price); }
		 * 
		 * int countOfBoard = orderDao.count(username);
		 * System.out.println(countOfBoard+"카운트오브 보드"); Page page =
		 * PagingUtil.getPage(pageno, countOfBoard); System.out.println(page+"페이지"); int
		 * srn = page.getStartRowNum(); int ern = page.getEndRowNum(); List<Order>
		 * orderList = orderDao.findAllByOrder(srn, ern, username);
		 * System.out.println(orderList+"오더리스트"); List<OrderDto.DtoForList> dtoList =
		 * new ArrayList<OrderDto.DtoForList>(); for(Order order:orderList) {
		 * OrderDto.DtoForList dto = modelMapper.map(order,OrderDto.DtoForList.class);
		 * System.out.println(dto+"디티오");
		 * dto.setOrderDateStr(order.getOrderDate().format(DateTimeFormatter.ofPattern(
		 * "yyyy년MM월dd일"))); dto.setArtName((String) session.getAttribute("artName"));
		 * dto.setArtPrice((int) session.getAttribute("artPrice"));
		 * System.out.println(dto+"ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"); dtoList.add(dto); }
		 * page.setOrderList(dtoList); return page;
		 */
	}

}