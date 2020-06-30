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
	
	@Test
	public void insertByOrderTest() {
		OrderDetail orderdetail = OrderDetail.builder().optno(2).artno(21).
				artistno(12).artname("ㅂㅁㅂ").optionName("검정").optionValue("2")
				.amount(3).price(123).address("학익동").recipient("나다").tel("0312").email("asdas@da.com")
					.request("안녕하").addPoint(3000).postalcode("qwe").refundAccount("12312").state("qwe").build();
			assertThat(orderDetaildao.insertByOrderDetail(orderdetail), is(notNullValue()));
	}
	//@Test
	public void deleteByOrderDetailTest() {
		assertThat(orderDetaildao.deleteByOrderDetail(2), is(notNullValue()));
	}
	//@Test
	public void OrderByAll() {
		orderDetaildao.OrderByAll(1,0);
		System.out.println(orderDetaildao.OrderByAll(9, 0));
	}
	//@Test
	public void findOrderByDetail() {
		orderDetaildao.findOrderByDetail(3);
	}
}
