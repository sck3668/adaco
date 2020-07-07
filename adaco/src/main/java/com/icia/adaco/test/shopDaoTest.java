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
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class shopDaoTest {
	@Autowired
	private ShopDao shopDao;

	//@Test
	public void inserTest() {
		Shop shop = Shop.builder().shopName("테스트").shopIntro("테스트해보기").
				businessno("사호").account("계좌번호").image("jpg").forwarding("인천").back("서울").artistno(14).build();
		assertThat(shopDao.writeByShop(shop), is(1));
	}
	
	//@Test
	public void updateTest() {
		Shop shop = Shop.builder().shopno(2).shopName("bb").shopIntro("bbbb").businessno("aa").account("aaa").build();
		assertThat(shopDao.updateByShop(shop), is(1));
	}
//	//@Test
//	public void findByShopnoTest() {
//		assertThat(shopDao.readByShop(2), is(notNullValue()));
//	}
//	//@Test
//	public void deleteTest() {
//		assertThat(shopDao.deleteByArt(3), is(1));
//	}
	
	@Test
	public void readT() {
		assertThat(shopDao.readByShop(169), is(notNullValue()));
	}
}
