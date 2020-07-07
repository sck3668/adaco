package com.icia.adaco.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class artCommentDaoTest {
	@Autowired
	private ArtCommentDao artcommentdao;
	
	//댓글 입력 테스트 ok
	//@Test
	public void insertTest() {
		ArtComment artcomment = ArtComment.builder().username("spring23235").artno(23).profile("aaa.jpg").content("하이하이").build();
		assertThat(artcommentdao.writeByCommentOfArt(artcomment), is(1));
		System.out.println(artcomment);
	}

	//댓글 삭제 테스트 ok
	//@Test
	public void delete() {
		assertThat(artcommentdao.deleteByCommentOfArt(15), is(1));
	}
	
	//댓글 목록 보기 테스트 ok
	//@Test
	public void listByCommentOfArt() {
		assertThat(artcommentdao.listByCommentOfArt(183), is(notNullValue()));

	}
	
	//댓글 상세 보기 테스트 ok
	//@Test
	public void readByCommentOfArtTest() {
		assertThat(artcommentdao.readByCommentOfArt(1), is(notNullValue()));
		assertThat(artcommentdao.readByCommentOfArt(1).getUsername(), is("spring23230"));
	}
	
}
