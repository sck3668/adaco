package com.icia.adaco.test;

import java.io.*;
import java.util.*;

import org.apache.commons.fileupload.*;
import org.junit.*;
import org.junit.runner.*;
import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.ArtDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class ArtServiceTest {
	@Autowired
	private ArtDao artdao;
	@Autowired
	private ArtService artservice;
	@Autowired
	private ModelMapper modelMapper;
	
	//작품 리스트 테스트 ok
	//@Test
	public void listTest() {
		Page map = artservice.list(2);
		System.out.println(map.getArtList());
	}
	
	//작품 등록 테스트
	/*@Test
	public void writeTest() {
		DtoForWrite dto;
		artservice.write(dto, new MultipartFile() {
			
			@Override
			public void transferTo(File dest) throws IOException, IllegalStateException {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public boolean isEmpty() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public long getSize() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public String getOriginalFilename() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getName() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public InputStream getInputStream() throws IOException {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getContentType() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public byte[] getBytes() throws IOException {
				// TODO Auto-generated method stub
				return null;
			}
		})

}*/
}