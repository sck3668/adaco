package com.icia.adaco.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.time.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.config.annotation.authentication.configurers.userdetails.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;
import org.springframework.test.context.web.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class AdminTest {

	@Autowired
	AdminBoardDao adminBoardDao;
	@Autowired
	AdminUserDao adminUserDao;
	@Autowired
	AuthorityDao authorityDao;
//	@Test
	public void noticeInsertTest() {
		adminBoardDao.insertByNotice(
				Notice.builder().content("내용").title("제목").writeDate(LocalDateTime.now()).writer("관리자").build());
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
		adminBoardDao.findFAQById(3);
	}

//	@Test
	public void findAllByFAQ() {
		adminBoardDao.findAllByFAQ();
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

//	@Test
	public void insertByCategory() {
		Category category = Category.builder().category("카테고리다2").build();
		adminBoardDao.insertByCategory(category);
	}

//	@Test
	public void deleteByCatehory() {
		adminBoardDao.deleteByCategory("카테고리다");
	}
	
//	@Test
	public void findQuestionById() {
		adminBoardDao.findQuestionById(1);
	}
	
//	@Test
	public void updateQuestionByAnswerTest() {
		adminBoardDao.updateQuestionByAnswer(Question.builder().answer("관리자").answerContent("답변이에요").answerDate(LocalDateTime.now()).qno(1).build());
	}
	
//	@Test
	public void deleteByArtTest() {
		assertThat(adminBoardDao.deleteByArt(2), is(0));
		assertThat(adminBoardDao.deleteByArt(1), is(1));
	}
	
//	@Test
	public void deleteByReportTest() {
		assertThat(adminBoardDao.deleteByReport(1), is(1));
	}
	
//	@Test
	public void findByReportTest() {
		adminBoardDao.findAllByReport(1, 10);
	}
	
	
	
	
	
	
//	유 저 테 스 트 유 저 테 스 트 유 저 테 스 트 유 저 테 스 트 유 저 테 스 트 유 저 테 스 트 유 저 테 스 트 유 저 테 스 트 유 저 테 스 트   
	
//	@Test
	public void updateByUserTest() {
		adminUserDao.updateByUser(User.builder().enabled(true).username("spring232").build());
	}
	
//	@Test
	public void authorityInsertTest() {
		authorityDao.insert("spring232", "ROLE_USER");
	}
	
//	@Test
	public void authorityUpdateTest() {
		authorityDao.update("spring232", "ROLE_MANAGER");
	}
	

}