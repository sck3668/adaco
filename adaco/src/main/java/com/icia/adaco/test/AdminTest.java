package com.icia.adaco.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.time.*;
import java.util.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.config.annotation.authentication.configurers.userdetails.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;
import org.springframework.test.context.web.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;
import com.icia.adaco.service.rest.*;
import com.icia.adaco.util.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
@WebAppConfiguration
public class AdminTest {
	
	@Autowired
	AdminBoardDao adminBoardDao;
	@Autowired
	AdminUserDao adminUserDao;
	@Autowired
	AuthorityDao authorityDao;
	@Autowired
	AdminUserService adminUserService;
	@Autowired
	AdminUserRestService adminUserRestService;
	@Autowired
	AdminBoardService adminBoardService;
	@Autowired
	AdminBoardRestService adminBoardRestService;
	@Autowired
	UserService userService;

	
	public void joinTest() {
	}
//	@Test
	public void noticeInsertTest() {
		adminBoardDao.insertByNotice(
				Notice.builder().content("내용").title("제목").writeDate(LocalDateTime.now()).writer("관리자").isImportant(false).build());
	}

//	@Test
	public void noticeUpdateTest() {
		Notice notice = Notice.builder().title("제목3").writeDate(LocalDateTime.now()).isImportant(true).noticeno(2).build();
		adminBoardDao.updateByNotice(notice);
	}

//	@Test
	public void noticeDeleteTest() {
		assertThat(adminBoardDao.deleteByNotice(2), is(1));
		assertThat(adminBoardDao.deleteByNotice(3), is(0));
	}
	
//	@Test
	public void countByReportTest() {
		adminBoardDao.countByReport();
	}

//	@Test
	public void findAllByImportantNoticeTest() {
		adminBoardDao.findAllByImportantNotice();
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
		adminBoardDao.findAllByReport(5, 10);
	}
	
//	@Test
	public void insertByQuestionTest() {
		adminBoardDao.insertByQuestion(Question.builder().writer("spring1234").title("제목").writeDate(LocalDateTime.of(2020, 06, 25, 0, 0)).content("내용임").build());
	}
	
//	@Test
	public void findByQuestionTest() {
		adminBoardDao.findAllByQuestion(1, 2, null, State.답변완료);
	}
	
//	@Test
	public void updateByQuestionTest() {
		adminBoardDao.updateQuestionByAnswer(Question.builder().qno(5).answer("관리자").answerContent("답변입니다.").answerDate(LocalDateTime.now()).state(State.답변완료).build());
	}
	
//	@Test
	public void countByQuestionTest() {
		adminBoardDao.countByQuestion("spr", "답변완료");
	}
	
//	@Test
	public void countByNoticeTest() {
		adminBoardDao.countByNotice(true);
	}
	
//	@Test
	public void findAllByNoticeTest() {
		adminBoardDao.findAllByNotice(1, 10, true);
	}
	
//	@Test
	public void findAllTest() {
		int cnt = adminBoardDao.countByReport();
		System.out.println(cnt);
		Page page = PagingUtil.getPage(2, cnt);
		System.out.println(page.getStartRowNum());
		System.out.println(page.getEndRowNum());
		List<ArtComment> list = adminBoardDao.findAllByReport(page.getStartRowNum(), page.getEndRowNum());
		System.out.println("AAAAAAAA"+list);
	}
	
//	@Test
	public void findNoticeByIdTest() {
		adminBoardDao.findNoticeById(3);
	}
	
//	@Test
	public void insertByQuestionTest22() {
		Question question = Question.builder().writer("spring123").content("내용").title("제목").writeDate(LocalDateTime.now()).state(State.답변대기).build();
		adminBoardDao.insertByQuestion(question);
	}
	
	
//	유 저 테 스 트 유 저 테 스 트 유 저 테 스 트 유 저 테 스 트 유 저 테 스 트 유 저 테 스 트 유 저 테 스 트 유 저 테 스 트 유 저 테 스 트   
	
//	@Test
	public void updateByUserTest() {
		adminUserDao.updateByUser(User.builder().enabled(true).username("spring232").build());
	}
	
//	@Test
	public void authorityInsertTest() {
		authorityDao.insert("spring23231", "ROLE_USER");
	}
	
//	@Test
	public void authorityUpdateTest() {
		authorityDao.update("spring232", "ROLE_MANAGER");
	}
	
//	@Test
	public void findByUserTest() {
		adminUserDao.findAllByUser(1, 20, null);
	}
	
//	@Test
	public void countByUserTest() {
		adminUserDao.countByUser("spring2320");
	}
	
//	@Test
	public void countByArtistTest() {
		adminUserDao.countByArtist("spring2320");
	}
	
//	@Test
	public void findUserByKeyWordTest() {
		adminUserDao.findUserByKeyWord(1, 10, "sp");
	}

//	@Test
	public void findAllByArtistTest() {
		adminUserDao.findAllByArtist(1, 30, null);
	}
	
//	@Test
	public void findAllByUserTest() {
		int cnt = adminUserDao.countByUser(null);
		System.out.println(cnt);
		Page page = PagingUtil.getPage(1, cnt);
		System.out.println(page.getStartRowNum());
		System.out.println(page.getEndRowNum());
		List<User> list = adminUserDao.findAllByUser(page.getStartRowNum(), page.getEndRowNum());
		System.out.println("AAAAAAAA"+list);
	}
	
//	@Test
	public void existsByArtistTest() {
		adminUserDao.existsByArtist("spring232");
	}
	
	
//	어 드 민 보 드 서 비 스 어 드 민 보 드 서 비 스 어 드 민 보 드 서 비 스 어 드 민 보 드 서 비 스 어 드 민 보 드 서 비 스 어 드 민 보 드 서 비 스 어 드 민 보 드 서 비 스 어 드 민 보 드 서 비 스 
//	@Test
	public void adminReportListTest() {
		adminBoardService.reportList(2);
	}
	
//	@Test
	public void adminQuestionListTest() {
		adminBoardService.questionList(1, null, State.답변완료);
	}
	
//	@Test
	public void adminQuestionReadTest() {
		System.out.println(adminBoardService.questionRead(5));
	}
	
//	@Test
	public void adminQuestionAnswerTest() {
		adminBoardService.questionAnswer(Question.builder().answer("관리자").answerContent("답변이에요").qno(3).build());
	}
	
//	@Test
	public void adminNoticeListTest() {
		adminBoardService.noticeList(1, true);
	}
	
	
	
	
	
//  어 드 민 유 저 서 비 스 어 드 민 유 저 서 비 스 어 드 민 유 저 서 비 스 어 드 민 유 저 서 비 스 어 드 민 유 저 서 비 스 어 드 민 유 저 서 비 스 어 드 민 유 저 서 비 스 어 드 민 유 저 서 비 스   

	
//	@Test
	public void adminfindUserTest() {
		adminUserService.userList(1, "spring1234");
	}
	
//	@Test
	public void adminfindArtistTest() {
		System.out.println(adminUserService.artistList(1, null));
	}

//	@Test
	public void adminUserUpdateTest() {
		adminUserRestService.update("summer999", "ROLE_MANAGER", false);
	}
	
//	@Test
	public void adminArtistUpdateTest() {
		adminUserRestService.update("spring2321", "ROLE_MANAGER", false);
	}

	@Autowired
	ArtService artService;
	
	@Test
	public void artServiceTesT() {
		artService.listFromUser(2, null, null);
	}
}
