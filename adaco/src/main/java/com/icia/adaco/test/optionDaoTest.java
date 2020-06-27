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
public class optionDaoTest {
	
	@Autowired
	private OptionDao optiondao;
	
	// 옵션등록 테스트 ok
	//@Test
	public void insertTest() {
		Option option = Option.builder().artno(18).optionName("색상").optionValue("그린").optionStock(30).optionPrice(3000).build();
		assertThat(optiondao.writeByOption(option), is(1));
		System.out.println(option);
	}
	
	// 옵션 삭제 테스트 ok
	//@Test
	public void deleteTest() {
		assertThat(optiondao.deleteByOption(3),is(1));
	}
	
	//옵션 수정 테스트 ok
	//@Test
	public void updateTest() {
		Option option = Option.builder().optno(1).artno(18).optionName("사이즈").optionValue("200").optionStock(20).optionPrice(2000).build();
		optiondao.updateByOption(option);
	}
	
}
