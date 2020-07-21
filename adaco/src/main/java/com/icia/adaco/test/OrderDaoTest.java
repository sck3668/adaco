package com.icia.adaco.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.time.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class OrderDaoTest {
	@Autowired
	private OrderDao orderdao;
	
//	@Test
	public void insertByOrderTest() {
		Order order = Order.builder()
				.username("syi15931")
				.orderDate(LocalDateTime.now())
				.shippingCharge(3000)
				.build();
		assertThat(orderdao.Ordering(order), is(1));
		System.out.println(order);
	}
//	//@Test
//	public void updateByOrderTest() {
//		Order order = Order.builder().orderno(8).shippingCharge(10).build();
//		assertThat(orderdao.updateByOrder(order), is(1));
//	}
	
	//@Test
	public void deleteByOrderTest() {
		assertThat(orderdao.deleteByOrder(5), is(notNullValue()));
	}
	//@Test
	public void findByOrderTest() {
		orderdao.findByOrder(1);
		System.out.println(orderdao.findByOrder(9));
	}
//	@Test
//	public void findAllByOrderTest() {
//		orderdao.findAllByOrder(1);
//	}
	
	@Test
	public void findByOrder() {
		assertThat(orderdao.findUsernameByoderno(599), is("leehj5919"));
	}
}