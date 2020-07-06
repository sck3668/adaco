package com.icia.adaco.test;

import java.io.*;

import javax.inject.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.service.mvc.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class ShopServiceTest {
	
	@Inject
	private ShopService shopService;
	@Autowired(required = false)
	private MultipartFile sajin;
	@Inject
	private AuthorityDao dao;
	@Inject
	private ArtistDao artistdao;
	
	//@Test
	public void 승진Test() {
		dao.update("gurwl123", "ROLE_SELLER");
	}
	//테스트 실패
	public void ShopMadeTest() throws IllegalStateException, IOException {
		ShopDto.DtoForMade shopDto = ShopDto.DtoForMade.builder().artistno(1).shopName("서비스테스트")
				.shopIntro("서비스테스트입니다").image("adaco.jpg").businessno("12345").account("33").forwarding("인천에서")
				.back("서울").build();
		shopService.shopMade(shopDto, sajin,artistdao.findArtistnoByUsername("sck3668"));
	}
	
}
