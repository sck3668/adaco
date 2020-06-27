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
public class StoryCommentDaoTest {
	@Inject
	private StoryCommentDao storyCommentDao;
	
	//스토리 댓글 입력
	//@Test
//	public void insertTest() {
//		StoryComment storyComment = StoryComment.builder().cno(1).writeDate(LocalDateTime.now()).writer("테스트1")
//				.content("테스트입니다.").profile("jpg").storyno(8).username("spring23236").build();
//		assertThat(storyCommentDao.insertByCommentOfStory(storyComment), is(1));
//	}
	
    //스토리 댓글 페이징 입력
	//@Test
	public void insertTest2() {
		for (int i = 2; i < 12; i++) {
			storyCommentDao.insertByCommentOfStory(StoryComment.builder().cno(2).writeDate(LocalDateTime.now()).writer("테스트1")
			.content("테스트입니다.").profile("jpg").storyno(8).username("spring23236").build());
			}
		}
	
	//댓글 삭제
	//@Test
	public void deleteTest() {
		assertThat(storyCommentDao.deleteByCommentOfStory(1),is(0));
	}
	
	//댓글 목록보기 ( 페이징 된상태 )
	@Test
	public void findAllByCno() {
		List<StoryComment> list = new ArrayList<>();
		list = storyCommentDao.findAllByCno(1, 10);
		System.out.println(list);
	}
	
	
	
}
