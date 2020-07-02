package com.icia.adaco.service.rest;

import java.time.*;
import java.time.format.*;
import java.util.*;

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
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private ArtCommentDao artCommemtDao;
	@Value("d:/upload/artfile")
	private String artfileFolder;
	@Value("http://localhost:8081/artfile/")
	private String artfilePath;

	// 작품 업데이트
	public void updateArt(ArtDto.DtoForUpdate dto, MultipartFile artSajin) {
		Art art = artDao.readByArt(dto.getArtno());
		dto.setArtistNo(art.getArtistno());
		Option option = optionDao.readByOption(dto.getOptno());
		Artist artist = artistDao.findByid(dto.getArtistNo());
		if(art==null)
			throw new ArtNotFoundException();
		if(artist.getUsername().equals(dto.getUsername())==false)
			throw new JobFailException("상품 수정 권한이 없습니다");
		art = modelMapper.map(dto, Art.class);
		option = modelMapper.map(dto,Option.class);
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
		if(option!=null)
			option.setArtno(art.getArtno());
			dto.setOptno(option.getOptno());
			dto.setOptionName(option.getOptionName());
			dto.setOptionValue(option.getOptionValue());
			dto.setOptionStock(option.getOptionStock());
			dto.setOptionPrice(option.getOptionPrice());
		String str = art.getArtDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"));
		dto.setArtDate(str);
		System.out.println("작가상세" + dto);
		return dto;
	}
	
	// 작품 상세보기 옵션 포함(회원용)
	public ArtDto.DtoForRead readArtFromUser(Integer artno, Integer optno, String username) {
		Art art = artDao.readByArtFromUser(artno);
		Option option = optionDao.readByOption(optno);
		if(art==null)
			throw new ArtNotFoundException();
		ArtDto.DtoForRead dto = modelMapper.map(art, ArtDto.DtoForRead.class);
		if(option!=null)
			option.setArtno(art.getArtno());
			dto.setOptno(option.getOptno());
			dto.setOptionName(option.getOptionName());
			dto.setOptionValue(option.getOptionValue());
			dto.setOptionStock(option.getOptionStock());
			dto.setOptionPrice(option.getOptionPrice());
		if(username!=null)
			artDao.updateByArt(Art.builder().artno(artno).readCnt(1).build());
		return dto;
	}

	// 작품 이미지 찾기
	public String findArtfile(Integer artno) {
		Art art = artDao.readByArt(artno);
		return art.getArtImg();
	}

	// 작품 삭제
	public boolean deleteArt(Integer artno, String username, Integer artistno, Integer optno) {
		Art art = artDao.readByArt(artno);
		Option option = optionDao.readByOption(optno);
		String artWriter = artistDao.findByid(artistno).getUsername();
		if(art==null)
			throw new ArtNotFoundException();
		if(username.equals(artWriter)==false)
			throw new IllegalJobException();
		option.setArtno(art.getArtno());
		optionDao.deleteByOption(optno);
		return artDao.deleteByArt(artno)==1;
	}
	
	// 작품 댓글 작성하기
	public List<ArtComment> writeCommentOfArt(ArtComment artcomment){
		artcomment.setWriteDate(LocalDateTime.now());
		String reviewStr = artcomment.getContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		artcomment.setContent(reviewStr);
		artCommemtDao.writeByCommentOfArt(artcomment);
		artDao.updateByArt(Art.builder().artno(artcomment.getArtno()).artCommentCnt(1).build());
		return artCommemtDao.listByCommentOfArt(artcomment.getArtno());
	}
	
	// 작품 댓글 삭제하기
	//public List<ArtComment> deleteCommentOfArt
	
	

	
}
