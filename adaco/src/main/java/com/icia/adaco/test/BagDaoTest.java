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
	
	//@Test
	public void insertTest() {
		Bag bag = 
		Bag.builder().username("spring2321").artno(10)
		.totalPrice(100).amount(10).optionName("모니터")
		.optionValue("11").build();
		
		assertThat(bagdao.insert(bag), is(notNullValue()));
	}
	//@Test
	public void updateTest() {
		Bag bag = Bag.builder().username("spring2321").artno(10)
				.totalPrice(10000).amount(1)
				.optionName("색상").optionValue("12")
				.build();
		assertThat(bagdao.update(bag), is(1));
	}
	//@Test
	public void deleteTest() {
		assertThat(bagdao.delete(3), is(1));
	}
}
  