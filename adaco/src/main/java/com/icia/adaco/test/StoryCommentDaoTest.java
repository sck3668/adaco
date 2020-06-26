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
public class StoryCommentDaoTest {
	@Inject
	private StoryCommentDao storyCommentDao;
	
	//스토리 댓글 입력
	@Test
	public void insertTest() {
		StoryComment storyComment = StoryComment.builder().cno(1).writeDate(LocalDateTime.now()).writer("테스트1")
				.content("테스트입니다.").profile("jpg").storyno(1).username("혁").build();
		assertThat(storyCommentDao.insertByCommentOfStory(storyComment), is(1));
	}
	
}
