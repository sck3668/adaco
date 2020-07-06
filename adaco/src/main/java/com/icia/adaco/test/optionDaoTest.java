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
		Option option = Option.builder().artno(23).optionName("색상").optionValue("옐로우").optionStock(30).optionPrice(3000).build();
		assertThat(optiondao.writeByOption(option), is(1));
		System.out.println(option);
	}
	
	// 옵션 삭제 테스트 ok
	//@Test
	public void deleteTest() {
		assertThat(optiondao.deleteByOption(22),is(1));
	}
	
	//옵션 수정 테스트 ok
	//@Test
	public void updateTest() {
		Option option = Option.builder().optno(24).artno(23).optionName("사이즈").optionValue("200").optionStock(20).optionPrice(2000).build();
		optiondao.updateByOption(option);
	}
	
	//옵션 목록보기 테스트 ok
	//@Test
	public void listByOptionTest() {
		assertThat(optiondao.listByOption(), is(notNullValue()));
	}
	
	//작품 번호로 옵션 전체 불러오기 ok
	//@Test
	public void readByArtnoTest() {
		assertThat(optiondao.readByArtno(13), is(notNullValue()));
		assertThat(optiondao.readByArtno(13).getOptionName(),is("색상"));
	}
	
	
}
