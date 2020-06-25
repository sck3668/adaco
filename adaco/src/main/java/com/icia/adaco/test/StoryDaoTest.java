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
public class StoryDaoTest {
	@Inject
	private StoryDao storyDao;
	
	//
	public void insertTest() {
		Story story = Story.builder().storyNo(3).writeDate(LocalDateTime.now()).title("안녕").content("하세요").artistNo(1).build();
		assertThat(storyDao.insert(story),is(1));
	}
	//삭제
	//@Test
	public void deleteTest() {
		assertThat(storyDao.delete(1),is(1));
	}
	
}
