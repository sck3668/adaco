package com.icia.adaco.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class BagServiceTest {
	@Autowired
	private BagDao bagdao;
	@Autowired
	private BagService bagservice;
	@Autowired
	private ArtDao artDao;
	@Autowired
	private OptionDao optionDao;
	//장바구니 추가 서비스 테스트
	
	//@Test
	public void insertTest() {
		Bag bag = Bag.builder().username("sck3668").artno(4).totalPrice(30000).amount(3).optionName("색상").optionValue("red").optionStock(10).optionPrice(3000).build();
		assertThat(bagservice.insertByBag(bag), is(1));
	}
	
	//@Test
	public void findAllBagByUsernameTest() {
		assertThat(bagservice.findAllBagByUsername("sck3668"), is(notNullValue()));
	}
	
	
	@Test
	public void inserByBagTest() {
		Art art = artDao.readByArt(280);
		Option option = optionDao.readOptionByArtno(133);
		BagDto.DtoForWrite dto = BagDto.DtoForWrite.builder().artno(280).artName(art.getArtName())
				.price(art.getPrice()).mainImg(art.getMainImg())
				.artDate(art.getArtDate()).amount(art.getStock())
				.totalPrice(art.getPrice()).optionName(option.getOptionName())
				.optionValue(option.getOptionValue())
				.couriPrice(art.getCouriPrice()).build();
		assertThat(bagservice.insertByBag("spring131", dto),is(1));
	}
	
	
	// 장바구니 추가 Test
	//@Test
	public void insertByBagTest() {
		Bag bag = 
				Bag.builder().username("spring23230")
				.artno(33).totalPrice(2000).amount(8)
				.optionName("사이즈").optionValue("24").build	();
		int b = bagdao.insertByBag(bag);
		assertThat(b, is(1));
		
	}
	
	// 장바구니 목록 Test
	//@Test
	public void findAllByBagTest() {
		//bagservice.findAllByBag();
	}
	
	// 장바구니 변경 테스트
	// @Test
	public void updateByBagTest() {
		Bag bag =
				Bag.builder().username("spring2322").artno(35)
				.totalPrice(20000).amount(2)
				.optionName("사이즈").optionValue("111")
				.build();
		int b = bagdao.updateByBag(bag);
		assertThat(b, is(1));
	}
	// 장바구니 작품 보기 Test
	//@Test
	public void findByArtnoTest() {
		bagservice.findByArtno(35);
		
	}
	
	//@Test
//	public void deleteByBagTest() {	
//		bagservice.deleteByBag(33);
//	}
}
