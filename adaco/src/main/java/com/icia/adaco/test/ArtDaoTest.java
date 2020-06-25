package com.icia.adaco.dao;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.adaco.entity.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class ArtDaoTest {
	@Autowired
	private ArtDao artdao;
	
	@Test
	public void insertTest() {
		Art art = Art.builder().artName("신상").price(1000).mainImg(true).artImg(false).stock(300).tag("검색").category("목걸이").shopNo(1234).couriPrice(3000).returnAddress("배송지야").courier("대한통운").accumulated(500).artistNo(123).build();
		assertThat(artdao.writeByArt(art), is(1));
		System.out.println(art);
	}
	
	

}
