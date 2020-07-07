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
public class aritstDaoT {
	@Autowired
	private ArtistDao artistDao;
	
	//@Test
	public void insertT() {
	Artist artist = Artist.builder().artistIntro("안녕하세요").profile("aa.jpg").username("하이요").build();
	assertThat(artistDao.insert(artist),is(1));
	}
	//@Test
	public void updateT() {
	Artist artist = Artist.builder().artistno(4).artistIntro("안녕못하지").build();
		assertThat(artistDao.update(artist),is(1));
	}
	//@Test
	public void deleteT() {
		System.out.println(artistDao.delete(4));
	}
	
	@Test
	public void artT() {
		artistDao.findArtistnoByUsername("gurwl123");
	}
}
