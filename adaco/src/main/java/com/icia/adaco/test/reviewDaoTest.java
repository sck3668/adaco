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
public class reviewDaoTest {
	@Autowired
	private ReviewDao reviewdao;
	
	//리뷰등록 테스트 ok
	//@Test
	public void insertTest() {
	//Review review = Review.builder().star(star.fivePoint).content("만족해요").image("aaa.jpg").artno(12).username("spring232").build();
	//assertThat(reviewdao.writeByCommentOfArt(review),is(1));
	for(int i=1; i<=10; i++) {
		reviewdao.writeByCommentOfArt(Review.builder().star(star.fivePoint).content("만족해요").image("aaa.jpg").artno(12).username("spring232").build());
	}
	
	//System.out.println(review);
	}
	
	
	//리뷰삭제 테스트
	//@Test
	public void deleteTest() {
		assertThat(reviewdao.deleteByCommentOfArt(2), is(1));
	}
	
	
	
	
	
	
}
