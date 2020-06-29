package com.icia.adaco.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.time.*;
import java.util.*;

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
	
	
	//쪽지 입력
	//@Test
//	public void insertTest() {
//		Message message = Message.builder().title("테스트").username("혁지").content("아아")
//				.sendId("gk").recipientId("아").msgCheck(0).writeDate(LocalDateTime.now()).build();
//				assertThat(messageDao.insert(message), is(1));
//				
//	}
	//쪽지 페이징 쿼리 테스트 입력
	//@Test
	public void insertTest1() {
			for (int i = 2; i < 12; i++) {
				messageDao.insert(Message.builder().title("테스트").username("spring23236").content("아아")
						.sendId("gk").recipientId("아").msgCheck(false).writeDate(LocalDateTime.now()).build());
				}
			}
	
	//@Test
	public void deleteTest() {
		assertThat(messageDao.delete(), is(1));
	}
	
	//쪽지 페이지 목록보기
	//@Test
	public void findAllMessageTest() {
		List<Message> list = new ArrayList<>();
		list = messageDao.findAllMessage(1, 10);
		System.out.println(list);
	}
}
