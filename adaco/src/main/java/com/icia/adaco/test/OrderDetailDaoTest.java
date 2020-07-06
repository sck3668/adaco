package com.icia.adaco.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class OrderDetailDaoTest {
	@Autowired
	private OrderDetailDao orderDetaildao;
	
	//@Test
	public void Payment() {
		OrderDetail orderdetail = OrderDetail.builder()
				.orderno(1)
				.optno(88)
				.artno(58)
				.artistno(14)
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
	
	@Test
	public void OrderDetailTest() {
		orderDetaildao.OrderDetail(1);
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