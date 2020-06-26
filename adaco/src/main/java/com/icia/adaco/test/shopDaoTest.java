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
		Shop shop = Shop.builder().shopName("aa").shopIntro("aaaa").businessno("aa").account("aaa").build();
		assertThat(shopDao.writeByShop(shop), is(1));
	}
	
	//@Test
	public void updateTest() {
		Shop shop = Shop.builder().shopno(2).shopName("bb").shopIntro("bbbb").businessno("aa").account("aaa").build();
		assertThat(shopDao.updateByShop(shop), is(1));
	}
	//@Test
	public void findByShopnoTest() {
		assertThat(shopDao.readByShop(2), is(notNullValue()));
	}
	//@Test
	public void deleteTest() {
		assertThat(shopDao.deleteByArt(3), is(1));
	}
}
