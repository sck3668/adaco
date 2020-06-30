package com.icia.adaco.service.rest;

import java.time.format.*;

import javax.validation.constraints.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
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

	//작품 업데이트
	public void updateArt(ArtDto.DtoForUpdate dto) {
		Art art = artDao.readByArt(dto.getArtno());
		Option option = modelMapper.map(dto,Option.class);
		Artist artist = artistDao.findByid(dto.getArtistNo());
		if(art==null)
			throw new ArtNotFoundException();
		if(artist.getUsername().equals(dto.getUsername())==false)
			throw new IllegalJobException();
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
		if(art==null)
			throw new ArtNotFoundException();
		ArtDto.DtoForRead dto = modelMapper.map(art, ArtDto.DtoForRead.class);
		dto = modelMapper.map(option, ArtDto.DtoForRead.class);
		String str = art.getArtDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"));
		dto.setArtDate(str);
		
		return dto;
	}
//
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
