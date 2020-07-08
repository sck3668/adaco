package com.icia.adaco.service.rest;

import java.io.*;
import java.time.*;
import java.time.format.*;
import java.util.*;

import javax.validation.constraints.*;

import org.apache.ibatis.session.*;
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
	public void updateArt(ArtDto.DtoForUpdate dto, MultipartFile artSajin) throws IllegalStateException, IOException {
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
		if(artSajin!=null && artSajin.isEmpty()==false) {
			File file = new File("d:/upload/artfile",artSajin.getName());
			if (file.exists() == true) {
				System.out.println("파일이" + file);
				file.delete();
				
			}
			if (artSajin.getContentType().toLowerCase().startsWith("image/") == true) {
				int lastIndexOfDot = artSajin.getOriginalFilename().lastIndexOf('.');
				String extension = artSajin.getOriginalFilename().substring(lastIndexOfDot + 1);
				File artfile = new File(artfileFolder, art.getArtName() + "." + extension);
				System.out.println("아트네임확인" + art.getArtName());
				artSajin.transferTo(artfile);
				art.setMainImg(artfilePath + artfile.getName());
			} else {
				throw new JobFailException("파일 확장자를 확인해주세요");
			}
		} else {
			throw new JobFailException("등록된 사진이 없습니다");
		}
		option.setArtno(art.getArtno());
		optionDao.updateByOption(option);
		artDao.updateByArt(art);
	}

	// 작품 상세보기 옵션 포함(작가용)
	public ArtDto.DtoForRead readArt(Integer artno, String username) {
		Art art = artDao.readByArt(artno);
		Option option = optionDao.readByArtno(artno);
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
		return dto;
	}
	
	// 작품 상세보기 옵션 포함(회원용)
	public ArtDto.DtoForRead readArtFromUser(Integer artno, String username) {
		Art art = artDao.readByArtFromUser(artno);
		Option option = optionDao.readByArtno(artno);
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
		if(art.getArtCommentCnt()>0)
			dto.setArtComments(artCommemtDao.listByCommentOfArt(dto.getArtno()));
		System.out.println("디티오"+dto);
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
		String commentStr = artcomment.getContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		artcomment.setContent(commentStr);
		artCommemtDao.writeByCommentOfArt(artcomment);
		artDao.updateByArt(Art.builder().artno(artcomment.getArtno()).artCommentCnt(1).build());
		//System.out.println("댓글이 나오려나"  +artcomment);
		return artCommemtDao.listByCommentOfArt(artcomment.getArtno());
	}
	
	// 작품 댓글 삭제하기
	public List<ArtComment> deleteCommentOfArt(Integer cno, Integer artno, String username){
		ArtComment artcomment = artCommemtDao.readByCommentOfArt(cno);
		if(username.equals(artcomment.getUsername())==false)
			throw new JobFailException("댓글을 삭제할 수 없습니다");
		artCommemtDao.deleteByCommentOfArt(cno);
		return artCommemtDao.listByCommentOfArt(cno);
	}
	
	// 작품 댓글 신고 
/*	public int report(int cno, String username, boolean isReport) {
		ArtComment artcomment = artCommemtDao.readByCommentOfArt(cno);
		if(artcomment==null)
			throw new ArtCommentNotFoundException();
		if(
	}*/
	
	// 작품 리뷰 작성 하기
	
	// 작품 리뷰 삭제 하기
	
	
	
}
