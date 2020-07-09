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
public class StoryDaoTest {
	@Inject
	private StoryDao storyDao;

	// @Test
	public void insertTest() {
		for (int i = 1; i < 11; i++) {
			storyDao.insert(Story.builder().artistno(8).writeDate(LocalDateTime.now()).title("안녕" + i).content("하세요").writer("글쓴이")
					.image("d.jpg").build());
		}
	}

	// @Test
	public void updateT() {
		Story story = Story.builder().storyno(4).title("gd").build();
		storyDao.update(story);
	}

	 @Test
	public void deleteTest() {
		assertThat(storyDao.delete(227), is(notNullValue()));
	}

	//@Test
	public void findAllStoryTest() {
		List<Story> list = new ArrayList<>();
		list = storyDao.findAllStory(1, 10);
		System.out.println(list);
	}

	// @Test
	public void findByStoryTest() {
		storyDao.findByStory(5);
		System.out.println(storyDao);
	}
}
