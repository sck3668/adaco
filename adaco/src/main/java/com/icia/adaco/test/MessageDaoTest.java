package com.icia.adaco.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.time.*;

import javax.inject.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class MessageDaoTest {
	@Inject
	private MessageDao messageDao;
	
	//@Test
	public void insertTest() {
		Message message = Message.builder().title("테스트").username("혁지").content("아아")
				.sendId("gk").recipientId("아").msgCheck(0).writeDate(LocalDateTime.now()).build();
				assertThat(messageDao.insert(message), is(1));
				
	}
	@Test
	public void deleteTest() {
		assertThat(messageDao.delete(1), is(1));
	}
	
	//@Test
	public void findAllMessageTest() {
		messageDao.findAllMessage();
	}
}
