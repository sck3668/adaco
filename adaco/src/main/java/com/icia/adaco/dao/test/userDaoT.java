package com.icia.adaco.dao.test;

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
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class userDaoT {
	@Autowired
	private UserDao userDao ;
	@Test
	public void insertT() {
		User user =
	User.builder().username("tjdcjfgns215").password("1234")
	.email("tjdcjfgns@naver.com").irum("성철훈").
	birthDate(LocalDateTime.now()).profile("aaa.jpg").address("용현동산다").tel("01024262394").build();
		
	assertThat(userDao.insert(user),is("tjdcjfgns"));	
	}
}
