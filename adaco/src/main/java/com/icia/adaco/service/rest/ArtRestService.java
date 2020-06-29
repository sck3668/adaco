package com.icia.adaco.service.rest;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;

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

	//작품 업데이트
	public void updateArt(ArtDto.DtoForUpdate dto) {
		Art art = artDao.readByArt(dto.getArtno());
		if(art==null)
			throw new ArtNotFoundException();
		if(art.getArtistno().equals(dto.get))
	}
	
	
	
}
