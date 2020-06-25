package com.icia.adaco.test;

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
public class AdminTest {
	@Autowired
	private AdminBoardDao adminBoardDao;
	
//	@Test
	public void noticeInsertTest() {
		adminBoardDao.insertByNotice(Notice.builder().content("내용").title("제목").writeDate(LocalDateTime.now()).writer("관리자").build());
	}
	
//	@Test
	public void noticeUpdateTest() {
		Notice notice = Notice.builder().title("제목3").writeDate(LocalDateTime.now()).noticeno(2).build();
		adminBoardDao.updateByNotice(notice);
	}
	
//	@Test
	public void noticeDeleteTest() {
		assertThat(adminBoardDao.deleteByNotice(2), is(1));
		assertThat(adminBoardDao.deleteByNotice(3), is(0));
	}
	
//	@Test
	public void faqInsertTest() {
		adminBoardDao.insertByFAQ(FAQ.builder().content("내용입니다.").title("제목입니다.").build());
	}
	
//	@Test
	public void findFAQById() {
//		adminBoardDao.findFAQById(3);
	}
	
//	@Test
	public void findAllByFAQ() {
//		adminBoardDao.findAllByFAQ();
	}
	
//	@Test
	public void updateByFAQTest() {
		FAQ faq = FAQ.builder().title("새로운제목").content("새로운내용").faqno(2).build();
		adminBoardDao.updateByFAQ(faq);
	}
	
//	@Test
	public void deleteByFAQTest() {
		assertThat(adminBoardDao.deleteByFAQ(3), is(0));
		assertThat(adminBoardDao.deleteByFAQ(2), is(1));
	}
	
	@Test
	public void insertByCategory() {
		Category category = Category.builder().category("카테고리다2").build();
		adminBoardDao.insertByCategory(category);
	}
	
	public void updateByCatehory() {
		Category.builder().category("새로운카테고리")
	}
	
	
	
}
