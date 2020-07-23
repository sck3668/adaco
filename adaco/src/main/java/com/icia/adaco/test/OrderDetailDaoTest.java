package com.icia.adaco.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.ArtDto.*;
import com.icia.adaco.dto.OrderDetailDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class OrderDetailDaoTest {
	@Autowired
	private OrderDetailDao orderDetaildao;
	@Autowired
	private OrderDetailService orderDetailService;
	
	//@Test
	public void Payment() {
		OrderDetail orderdetail = OrderDetail.builder()
				.orderno(203)
				.optno(167)
				.artno(307)
				.artistno(200)
				.artname("변경신상")
				.optionName("테스트옵션")
				.optionValue("얍얍")
				.amount(5)
				.price(8000)
				.address("학익동1")
				.recipient("나다1")
				.tel("03121")
				.email("asdas@da.com1")
				.request("안녕하3")
				.addPoint(2000)
				.postalcode("qwe1")
				.refundAccount("123121")
				.state("배송중").build();
			assertThat(orderDetaildao.Payment(orderdetail), is(notNullValue())); 
			System.out.println(orderdetail);
	}
	
	//@Test
	public void OrderDetailTest() {
		orderDetaildao.OrderDetail(1);
	}
	
	//////작가 전용//////////
	//작가번호로 주문 리스트 테스트 ok
	//@Test
		public void listByArtTest() {
			assertThat(orderDetaildao.FindAllOrderByArtist(1,10,200),is(notNullValue()));
		}
	
	// 주문번호 업데이트 테스트 ok
	//@Test
		public void updateByOrderTest() {
			OrderDetail orderDetail = OrderDetail.builder().orderno(955).orderstate(orderState.배송중).build();
			assertThat(orderDetaildao.updateByOrderDetail(orderDetail), is(1));
		}
		
	//고객 주문 상세보기 테스트
	//@Test
	public void readOrderTest() {
		DtoForReadOrder order = orderDetailService.OrderDetailByArtist(675, "leehj5919");
		assertThat(order.getArtistno(), is(200));
	}
	
	//주문상태로 검색한 주문 건 수 ok
	//@Test
	public void countSearchByStateTest() {
		orderDetaildao.countSearchByState("입금대기");
	}
	
	//주문리스트(주문번호순) + 주문상태로 검색한 주문리스트 ok
	//@Test
	public void FindAllOrderByArtist() {
		assertThat(orderDetaildao.FindAllOrderByArtist(1, 14, 200, "입금대기"),is(notNullValue()));
	}
	
	// 주문리스트 + 주문상태로 검색 테스트 ok
	@Test
	public void OrderListByArtistTest() {
		orderDetailService.OrderListByArtist(1, "leehj8462", "입금대기");
	}

	
	//@Test
//	public void deleteByOrderDetailTest() {
//		assertThat(orderDetaildao.deleteByOrderDetail(2), is(notNullValue()));
//	}
	//@Test
//	public void OrderByAll() {
//		orderDetaildao.OrderByAll(1,0);
//		System.out.println(orderDetaildao.OrderByAll(9, 0));
//	}
	//@Test
//	public void findOrderByDetail() {
//		orderDetaildao.findOrderByDetail(3);
//	}
}