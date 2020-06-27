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
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class userDaoT {
	@Autowired
	private UserDao userDao;

	//@Test
	public void insertT() {
		User user = User.builder().username("spring22").password("1234")
				.email("tj@na").irum("d").profile("aaa.jpg").birthDate(LocalDateTime.now())
				.address("용현동산다").tel("01024262394").build();
		assertThat(userDao.insert(user), is(1));
	}
	//@Test
	public void updateT() {
		User user = User.builder().username("spring22").password("12345").email("tjdcjf@dsa.com").irum("gg")
				.profile("aa.jpg").birthDate(LocalDateTime.now()).address("5동산다").tel("010").build();
			assertThat(userDao.update(user),is(1));
				
	}
	//@Test
	public void deleteT() {
		userDao.delete("spring22");
	}
}
