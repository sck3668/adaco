package com.icia.adaco.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.io.*;
import java.time.*;
import java.util.*;

import javax.mail.*;

import org.apache.commons.fileupload.*;
import org.junit.*;
import org.junit.runner.*;
import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.mock.web.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.multipart.*;


import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.ArtDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;
import com.icia.adaco.service.rest.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class ArtServiceTest {
	@Autowired
	private ArtDao artdao;
	@Autowired
	private ArtService artservice;
	@Autowired
	private ArtRestService service;
	@Autowired
	private ModelMapper modelMapper;

	// 작품 리스트 테스트(작가입장) ok
	//@Test
	/*public void listTest() {
		artservice.list(1, null);
	}*/

	// 작품 리스트 테스트(회원입장) ok
	//@Test
	public void listFromUserTest() {
		artservice.listFromUser(1, null);
	}

	// 테스트용 생성 메소드
	public ArtDto.DtoForWrite getDtoForWrite() {
		ArtDto.DtoForWrite dto = new DtoForWrite();
		dto.setArtDate(LocalDateTime.now());
		dto.setArtName("테스트상품22");
		dto.setCategory("카테고리다2");
		dto.setCourier("로젠택배");
		dto.setTag("검색태그");
		dto.setStock(30);
		dto.setPrice(35000);
		dto.setOptno(1);
		dto.setOptionName("색상");
		dto.setOptionPrice(2000);
		dto.setOptionStock(20);
		dto.setOptionValue("레드");
		dto.setArtistno(150);
		dto.setShopno(5);
		dto.setArtDetail("작품입니다");
		dto.setCouriPrice(2500);
		return dto;
	}
	
	
	// 작품 등록 테스트 (작가용) ok
	//@Test
/*	public void writeWithSajinTest() throws IllegalStateException, IOException, MessagingException {
		ArtDto.DtoForWrite dto = getDtoForWrite();
		File targetFile = new File("d:/test2.jpg");
		MockMultipartFile file = new MockMultipartFile("artSajin", targetFile.getName(), "image/jpeg", new FileInputStream(targetFile));
		artservice.write(dto, file);
		
	}*/
	//
	//작품 업데이트 테스트 메소드
	public ArtDto.DtoForUpdate getDtoForUpdate() {
		ArtDto.DtoForUpdate dto = new DtoForUpdate();
		dto.setArtno(342);
		dto.setArtistNo(200);
		dto.setUsername("leehj8462");
		dto.setArtDetail("작품이야아아");
		dto.setOptno(192);
		dto.setOptionName("사이즈");
		return dto;
	}
	
	//작품 업데이트 테스트  ok
	@Test
	public void updateTest() throws FileNotFoundException, IOException {
		ArtDto.DtoForUpdate dto = getDtoForUpdate();
		File targetFile = new File("d:/test4.jpg");
		MockMultipartFile file = new MockMultipartFile("artSajin", targetFile.getName(), "image/jpeg", new FileInputStream(targetFile));
		service.updateArt(dto, file);
		
	}
	//
	//작품 상세보기 테스트(작가용) ok
	//@Test
	public void readFromArtistTest() {
		DtoForRead art = service.readArt(58, "spring123");
		assertThat(art.getOptionName(), is("색상"));
	}
	
	// 작품 상세 보기 테스트(회원용) ok
	//@Test
	public void readArtFromUserTest() {
		DtoForRead art = service.readArtFromUser(147,"spring123");
		assertThat(art, is(notNullValue()));
	}
	
	// 작품 삭제 테스트 ok
	//@Test
	public void deleteTest() {
		boolean result = service.deleteArt(324, "leehj8462");
		assertThat(result, is(true));	
	}
	
	// 작품 댓글 작성 테스트 ok
	//@Test
	public void writeArtCommentTest() {
		ArtComment artcomment = ArtComment.builder().username("sprin1").artno(183).profile("aaaaa.jpg").content("댓글내용").build();
		service.writeCommentOfArt(artcomment);
	}
	
	// 작품 댓글 삭제 테스트 ok
	//@Test
	public void deleteArtCommentTest() {
		List<ArtComment> list = service.deleteCommentOfArt(62, 58, "tjdcjfgns6");
		assertThat(list.size(), is(12));
	}
	
	
		
}