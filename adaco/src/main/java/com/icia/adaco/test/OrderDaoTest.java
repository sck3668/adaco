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
	
	//@Test
	public void insertTest() {
		Order order = Order.builder().orderDate(LocalDateTime.now())
				.username("spring232").shippingCharge(100).build();
		assertThat(orderdao.insert(order), is(notNullValue()));
	}
	//@Test
	public void updateTest() {
		Order order = Order.builder().orderno(8).shippingCharge(10).build();
		assertThat(orderdao.update(order), is(1));
	}
	//@Test
	public void deleteTest() {
		assertThat(orderdao.delete(8), is(notNullValue()));
	}
	@Test
	public void findById() {
		orderdao.findById(9);
		System.out.println(orderdao.findById(9));
	}
}
