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
public class ArtDaoTest {
	@Autowired
	private ArtDao artdao;
	//////////// 작가 전용 테스트 ////////////////////
	
	//상품 등록 테스트 ok
	@Test
	public void insertTest() {
		Art art = Art.builder().artName("리뷰수1이야").price(1000).mainImg("aaa.jpg").artImg("bbb.jpg").stock(300).tag("검색").category("카테고리다").shopno(240).couriPrice(3000).courier("대한통운").accumulated(500).artistno(200).artDetail("신상이에요").reviewCnt(1).build();
		assertThat(artdao.writeByArt(art), is(1));
		/*for(int i=1; i<=10; i++) {
			artdao.writeByArt(Art.builder().artName("신상").price(1000).mainImg("aaa.jpg").artImg("bbb.jpg").stock(300).tag("검색").category("카테고리다").shopno(1).couriPrice(3000).returnAddress("배송지야").courier("대한통운").accumulated(500).artistno(12).build());
			}	*/
		System.out.println(art);
	}
	
	//작품 수정 테스트 ok
	//@Test 
	public void updateTest() {
		Art art = Art.builder().artno(45).artName("변경신상").price(2000).mainImg("ccc.jpg").artImg("ddd.jpg").stock(50).tag("태그얏").couriPrice(2500).returnAddress("배송지 업뎃").accumulated(1000).favoriteCnt(2).artDetail("상품설명 수정이얌").build();
		artdao.updateByArt(art);
	}
	
	//작품 삭제 테스트 ok
	@Test
	public void deleteTest() {
		assertThat(artdao.deleteByArt(336), is(1));
	}
	
	//작품 상세보기 테스트 ok
	//@Test
	public void readByArtTest() {
		assertThat(artdao.readByArt(45), is(notNullValue()));
		assertThat(artdao.readByArt(45).getArtName(),is("변경신상"));
	}
	
	//작품 내역보기 /최신순정렬 테스트  ok
	//@Test
		/*public void listByArtTest() {
			assertThat(artdao.listByArt(1,9),is(notNullValue()));
		}*/
	
	
	//작품 갯수 테스트 ok
	//@Test
	public void countByArtTest() {
		artdao.countByArt();
	}

	//////////// 회원 전용 테스트 ////////////////////
	
	//작품이름으로 검색한 작품 수 테스트 ok
	//@Test
	public void countSearchByArtNameTest() {
		artdao.countSerchByArtName("변경");
	}
	
	//작품 리스트(최신순) + 작품이름으로 검색 리스트 테스트  ok
	//@Test
	public void listByArtFromUser() {
		assertThat(artdao.listByArtFromUser(1, 1, "변경"),is(notNullValue()));
	}
	
	//일단 리뷰수가 5이상인 작품 리스트 테스트 ok
	//@Test
	public void listManyReviewByArt() {
		assertThat(artdao.listManyReviewByArt(1, 5),is(notNullValue()));
	}
	
	//일단 리뷰수가 5이상인 작품 수 ok
	//@Test
	public void countReviewByArtTest() {
		artdao.countReviewByArt();
	}
	
	//작품 상세보기 테스트 ok
	//@Test
		public void readByArtFromUserTest() {
			assertThat(artdao.readByArtFromUser(45), is(notNullValue()));
			assertThat(artdao.readByArtFromUser(45).getArtName(),is("변경신상"));
		}
  
}
