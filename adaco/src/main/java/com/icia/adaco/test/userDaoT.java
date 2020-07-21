package com.icia.adaco.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.time.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;
import org.springframework.transaction.annotation.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class userDaoT {
	@Autowired
	private UserDao userDao;
	
	
	//@Test
	public void idByCheckEmail() {
		System.out.println(userDao.findidByCheckEmail("tj@na"));
	}
	//@Test
	public void idByCheckTel() {
		System.out.println(userDao.findidByCheckTel("01024262394"));
	}
	//@Test
	public void existstt() {
		assertThat(userDao.existsUsername("spring232"),is(true));
	}
	//@Test
	public void existT() {
		assertThat(userDao.existsEmail("tj@na"),is(true));
	}
	//@Test
	public void insertT() {
				userDao.insert(User.builder().username("tjdcjfkd").password("1234")
				.email("tj@na@@dasfsa").irum("d").profile("aaa.jpg").birthDate(LocalDateTime.now()).checkCode("1111")
				.tel("01024262394").build());
		
	}
	//@Test
	public void updateT() {
		User user = User.builder().username("spring22").password("12345").email("tjdcjf@dsa.com").irum("gg")
				.profile("aa.jpg").birthDate(LocalDateTime.now()).address("5동산다").tel("010").build();
			assertThat(userDao.update(user),is(1));
				
	}
	//@Test
	public void findJoinCheckCode () {
		System.out.println(userDao.findJoinCheckCode("1111"));
	}
	//@Test
	public void pointInsert() {
		Point point = Point.builder().point(1234).endDate(LocalDateTime.now()).username("spring2324").build();
		assertThat(userDao.insertpoint(point),is(1));
	}
	//@Test
	public void findAllByPoint () {
		System.out.println(userDao.findAllByPoint("tjdcjfgns3"));
	}
	//@Test
	public void insertFavorite() {
		for(int i =0;i<11;i++) {
			userDao.insertFavorite(
			Favorite.builder().artno(5).username("spring232").build());
		}
	}
	//@Test
	public void findAllFavorite() {
		System.out.println(userDao.findAllFavorite("tjdcjfgns3")+"gggg");
	}
	//@Test
	public void deleteT() {
		userDao.delete("spring22");
	}
	//@Test
	public void deleteFavorite() {
		System.out.println(userDao.deleteFavorite(2));
	}
	//@Test
	//@Transactional
	public void deletereview() {
		System.out.println(userDao.reviewDelete(81));
	}
	//@Test
	public void reviewList() {
		System.out.println(userDao.listByReviewUser("tjdcjfgns3"));
	}
	//@Test
	public void findByusernameFavoriteId() {
		System.out.println(userDao.findByusernameFavoriteId("tjdcjfgns3"));
	}
	//@Test
	public void TotalPoint() {
		System.out.println(userDao.TotalPoint("tjdcjfgns3")+"토탈포인튼");
	}
	//작가사용
	//username으로 이름찾기 테스트
	@Test
	public void findByOrder() {
		assertThat(userDao.irumByUsername("leehj5919"), is("현주이"));
	}
		
}
