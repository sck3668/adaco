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
	
	//상품 등록 테스트 ok
	//@Test
	public void insertTest() {
		Art art = Art.builder().artName("새상품").price(1000).mainImg("aaa.jpg").artImg("bbb.jpg").stock(300).tag("검색").category("카테고리다").shopno(1).couriPrice(3000).returnAddress("배송지야").courier("대한통운").accumulated(500).artistno(3).build();
		assertThat(artdao.writeByArt(art), is(1));
		/*for(int i=1; i<=10; i++) {
			artdao.writeByArt(Art.builder().artName("신상").price(1000).mainImg(true).artImg(false).stock(300).tag("검색").category("카테고리다").shopno(1).couriPrice(3000).returnAddress("배송지야").courier("대한통운").accumulated(500).artistno(3).build());
			
			}	*/
		System.out.println(art);
	}
	
	//작품 수정 테스트 ok
	@Test 
	public void updateTest() {
		Art art = Art.builder().artno(18).artName("변경신상").price(2000).mainImg("ccc.jpg").artImg("ddd.jpg").stock(50).tag("태그얏").couriPrice(2500).returnAddress("배송지 업뎃").accumulated(1000).favorite(true).build();
		artdao.updateByArt(art);
	}
	
	//작품 삭제 테스트 ok
	//@Test
	public void deleteTest() {
		assertThat(artdao.deleteByArt(26), is(1));
	}
	
	//작품 상세보기 테스트 ok
	//@Test
	public void readByArtTest() {
		assertThat(artdao.readByArt(21), is(notNullValue()));
		assertThat(artdao.readByArt(21).getArtName(),is("새상품"));
	}
	
	//작품 내역보기 /최신순정렬 테스트
	
	
	
	
	
	

}