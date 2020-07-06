package com.icia.adaco.service.mvc;

import java.io.*;
import java.util.*;

import javax.validation.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.lang.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.ArtDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.util.*;

@Service
public class ArtService {
	@Autowired
	private ArtDao artdao;
	@Autowired
	private OptionDao optionDao;
	@Autowired
	private ModelMapper modelMapper;
	@Value("d:/upload/artfile")
	private String artfileFolder;
	@Value("http://localhost:8081/artfile/")
	private String artfilePath;

	// 작품 등록
	public void write(ArtDto.DtoForWrite dto, MultipartFile artSajin) throws IllegalStateException, IOException {
		Art art = modelMapper.map(dto, Art.class);
		Option option = modelMapper.map(dto, Option.class);
		if (artSajin!= null && artSajin.isEmpty()==false) {
			if (artSajin.getContentType().toLowerCase().startsWith("image/") == true) {
				int lastIndexOfDot = artSajin.getOriginalFilename().lastIndexOf('.');
				String extension = artSajin.getOriginalFilename().substring(lastIndexOfDot + 1);
				File artfile = new File(artfileFolder, art.getArtName() + "." + extension);
				artSajin.transferTo(artfile);
				art.setMainImg(artfilePath + artfile.getName());

			} else {
				throw new JobFailException("파일 확장자를 확인해주세요.");
			}
		} else {
			throw new JobFailException("작품 사진을 등록해주세요");
		}
		if (option!=null) {
			artdao.writeByArt(art);
			option.setArtno(art.getArtno());
			optionDao.writeByOption(option);
			art.setArtno(option.getOptno());
	
		} else {
			
		}
	}

	// 작품 리스트 (작가용) /
	public Page list(int pageno) {
		int countOfArt = artdao.countByArt();
		Page page = PagingUtil.getPage(pageno, countOfArt);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Art> artList = artdao.listByArt(srn, ern);
		List<ArtDto.DtoForList> dtoList = new ArrayList<ArtDto.DtoForList>();
		for (Art art : artList) {
			ArtDto.DtoForList dto = modelMapper.map(art, ArtDto.DtoForList.class);
			dtoList.add(dto);
		}
		page.setArtList(dtoList);
		return page;
	}

	// 작품 리스트 최신순 + 작품이름으로 작품 검색 (회원용)
	public Page listFromUser(int pageno, @Nullable String artname) {
		int countOfArt = artdao.countSerchByArtName(artname);
		Page page = PagingUtil.getPage(pageno, countOfArt);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		page.setSearch(artname);
		List<Art> artList = artdao.listByArtFromUser(srn, ern, artname);
		System.out.println("artlist===="+artList);
		List<ArtDto.DtoForList> dtoList = new ArrayList<ArtDto.DtoForList>();
		for (Art art : artList) {
			ArtDto.DtoForList dto = modelMapper.map(art, ArtDto.DtoForList.class);
			dtoList.add(dto);
		}
		System.out.println(dtoList+"==================");
		page.setArtList(dtoList);
		return page;
	}
	
	// 작품 (일단 리뷰가 5이상인) 리스트 (회원용)
	public Page listManyReview(int pageno) {
		int countOfArt = artdao.countReviewByArt();
		Page page = PagingUtil.getPage(pageno, countOfArt);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Art> artList = artdao.listManyReviewByArt(srn, ern);
		List<ArtDto.DtoForList> dtoList = new ArrayList<ArtDto.DtoForList>();
		for (Art art : artList) {
			ArtDto.DtoForList dto = modelMapper.map(art, ArtDto.DtoForList.class);
			dtoList.add(dto);
		}
		page.setArtList(dtoList);
		return page;
	}
}
