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
	Review review = Review.builder().star(star.onePoint).content("완전별로").image("aaa.jpg").artno(58).username("tjdcjfgns6").build();
	assertThat(reviewdao.writeByReviewOfArt(review),is(1));
	//for(int i=1; i<=10; i++) {
		//reviewdao.writeByReviewOfArt(Review.builder().star(star.fivePoint).content("만족해요").image("aaa.jpg").artno(28).username("spring23237").build());
	//}
	System.out.println(review);
	}
	
	//리뷰삭제 테스트 ok
	//@Test
	public void deleteTest() {
		assertThat(reviewdao.deleteByReviewOfArt(24), is(1));
	}
	
	//리뷰페이징 테스트 ok
	//@Test
	public void listByReviewOfArt() {
		assertThat(reviewdao.listByReviewOfArt(1,3),is(notNullValue()));
	}
	
	//리뷰상세(삭제위한) 테스트 ok
	//@Test
	public void readByReviewOfArt() {
		assertThat(reviewdao.readByReviewOfArt(81), is(notNullValue()));
		assertThat(reviewdao.readByReviewOfArt(81).getUsername(),is("tjdcjfg5") );
	}
	
	//리뷰갯수 테스트
	@Test
	public void countByReviewOfArt() {
		reviewdao.countByReviewOfArt();
	}
	
	
	
	
	
	
}
