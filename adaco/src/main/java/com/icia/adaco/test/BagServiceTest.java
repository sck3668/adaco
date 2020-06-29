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
import com.icia.adaco.service.mvc.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class BagServiceTest {
	@Autowired
	private BagDao bagDao;
	@Autowired
	private BagService bagservice;
	
	// 장바구니 추가 Test
	@Test
	public void insertByBagTest() {
		Bag bag = 
				Bag.builder().username("spring2322")
				.artno(35).totalPrice(1000).amount(7)
				.optionName("추가").optionValue("13").build();
		int b = bagDao.insertByBag(bag);
		assertThat(b, is(1));
		
	}
	
	// 장바구니 목록
	@Test
	public void findAllByBagTest)()
	
}
