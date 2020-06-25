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
public class BagDaoTest {
	@Autowired
	private BagDao bagdao;
	
	@Test
	public void insertTest() {
		Bag bag = 
		Bag.builder().username("spring").artno(1)
		.totalPrice(1000).amount(10).build();
		
		assertThat(bagdao.insert(bag), is(notNullValue()));
		
	}
}
  