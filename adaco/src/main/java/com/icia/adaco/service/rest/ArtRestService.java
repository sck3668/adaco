package com.icia.adaco.service.rest;

import java.time.format.*;

import javax.validation.constraints.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.ArtDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;

@Service
public class ArtRestService {
	@Autowired
	private ArtDao artDao;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	private OptionDao optionDao;
	@Value("d:/upload/artfile")
	private String artfileFolder;
	@Value("http://localhost:8081/artfile/")
	private String artfilePath;

	//작품 업데이트
	public void updateArt(ArtDto.DtoForUpdate dto, MultipartFile artSajin) {
		Art art = artDao.readByArt(dto.getArtno());
		Option option = modelMapper.map(dto,Option.class);
		Artist artist = artistDao.findByid(dto.getArtistNo());
		if(art==null)
			throw new ArtNotFoundException();
		if(artist.getUsername().equals(dto.getUsername())==false)
			throw new JobFailException("상품 수정 권한이 없습니다");
		art = modelMapper.map(dto, Art.class);
		option.setArtno(art.getArtno());
		optionDao.updateByOption(option);
		artDao.updateByArt(art);
		
	}

	// 작품 상세보기 옵션 포함(작가용)
	public ArtDto.DtoForRead readArt(Integer artno, Integer optno, String username) {
		Art art = artDao.readByArt(artno);
		Option option = optionDao.readByOption(optno);
		if(art==null)
			throw new ArtNotFoundException();
		ArtDto.DtoForRead dto = modelMapper.map(art, ArtDto.DtoForRead.class);
		dto = modelMapper.map(option, ArtDto.DtoForRead.class);
		String str = art.getArtDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"));
		dto.setArtDate(str);
		
		return dto;
	}
	
	// 작품 상세보기 옵션 포함(회원용)
	public ArtDto.DtoForRead readArtFromUser(Integer artno, Integer optno, String username) {
		Art art = artDao.readByArtFromUser(artno);
		Option option = optionDao.readByOption(optno);
		System.out.println("아트얌" + art);
		System.out.println("옵션아 들어와와아아아아" + option);
		if(art==null)
			throw new ArtNotFoundException();
		ArtDto.DtoForRead dto = modelMapper.map(art, ArtDto.DtoForRead.class);
		ArtDto.DtoForRead dto2 = modelMapper.map(option, ArtDto.DtoForRead.class);
		//dto.setArtno(dto2);
		System.out.println("중간"+dto);
		String str = art.getArtDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"));
		dto.setArtDate(str);
		if(username!=null)
			artDao.updateByArt(Art.builder().artno(artno).readCnt(0).build());
		System.out.println("완성"+dto);
		return dto;
	}

	// 작품 이미지 찾기
	public String findArtfile(Integer artno) {
		Art art = artDao.readByArt(artno);
		return art.getArtImg();
	}

	//작품 삭제
	public void deleteArt(Integer artno, String username, Integer artistno, Integer optno) {
		Art art = artDao.readByArt(artno);
		Option option = optionDao.readByOption(optno);
		String artWriter = artistDao.findByid(artistno).getUsername();
		if(art==null)
			throw new ArtNotFoundException();
		if(username.equals(artWriter)==false)
			throw new IllegalJobException();
		option.setArtno(art.getArtno());
		optionDao.updateByOption(option);
		artDao.deleteByArt(artno);
		
	}
	
	
	

	
}
