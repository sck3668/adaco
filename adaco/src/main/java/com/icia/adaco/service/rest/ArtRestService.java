package com.icia.adaco.service.rest;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.fasterxml.jackson.databind.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;

@Service
public class ArtRestService {
	@Autowired
	private ArtDao artDao;
	@Autowired
	private ArtCommentDao artCommentDao;
	@Autowired
	private ObjectMapper objectMapper;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private ArtistDao artistDao;

	//작품 업데이트
	public void updateArt(ArtDto.DtoForUpdate dto) {
		Art art = artDao.readByArt(dto.getArtno());
		Artist artist = artistDao.findByid(dto.getArtistNo());
		if(art==null)
			throw new ArtNotFoundException();
		if(artist.getUsername().equals(dto.getUsername())==false)
			throw new IllegalJobException();
		art = modelMapper.map(dto, Art.class);
		artDao.updateByArt(art);
		
	}
	
	
	
}
