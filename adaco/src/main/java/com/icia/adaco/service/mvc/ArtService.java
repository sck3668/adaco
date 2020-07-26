package com.icia.adaco.service.mvc;

import java.io.*;
import java.util.*;

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
import com.icia.adaco.service.rest.*;
import com.icia.adaco.util.*;

@Service
public class ArtService {
	@Autowired
	private ArtDao artdao;
	@Autowired
	private OptionDao optionDao;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private ArtistDao artistdao;
	@Autowired
	private ShopDao shopdao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderDetailDao orderDetailDao;
	@Autowired
	private ArtRestService service;
	@Value("d:/upload/artfile")
	private String artfileFolder;
	@Value("http://localhost:8081/artfile/")
	private String artfilePath;

	// 작품 등록
	public void write(ArtDto.DtoForWrite dto, List<MultipartFile> artSajin) throws IllegalStateException, IOException {
		Art art = modelMapper.map(dto, Art.class);
		Option option = modelMapper.map(dto, Option.class);
		List<String> list = new ArrayList<String>();
		if (artSajin != null && artSajin.isEmpty() == false) {
			int i = 0;
			for (MultipartFile sajin : artSajin) {
				if (sajin.getContentType().toLowerCase().startsWith("image/") == true) {
					long time = System.currentTimeMillis();
					int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf('.');
					String extension = sajin.getOriginalFilename().substring(lastIndexOfDot + 1);
					File artfile = new File(artfileFolder, time + i + "." + extension);
					sajin.transferTo(artfile);
					String gyungro = artfilePath + artfile.getName();
					art.setMainImg(gyungro);
					list.add(gyungro);
				} else {
					throw new JobFailException("파일 확장자를 확인해주세요.");
				}
			}
			if (option != null) {
				art.setAccumulated(art.getPrice() * 0.01);
				artdao.writeByArt(art);
				option.setArtno(art.getArtno());
				optionDao.writeByOption(option);
				for (String gyungroem : list)
					artdao.insertArtImg(ArtImg.builder().gyungro(gyungroem).artno(art.getArtno()).build());
			} else {
				throw new JobFailException("옵션을 등록해주세요.");
			}
		} else {
			throw new JobFailException("작품 사진을 등록해주세요");
		}
	}

	// 작품 등록 시 필요한 artistno와 shopno 받아오기
	public ArtDto.DtoForArtistnoAndShopno infoRead(String username) {
		Integer artistno = artistdao.findArtistnoByUsername(username);
		ArtDto.DtoForArtistnoAndShopno dto = new DtoForArtistnoAndShopno();
		dto.setArtistno(artistno);
		dto.setShopno(shopdao.readShopnoByArtistno(artistno));
		return dto;
	}

	// 작품 리스트 (작가용)
	public Page list(int pageno, @Nullable String category, String username) {
		Integer artistno = artistdao.findArtistnoByUsername(username);
		int countOfArt = artdao.countSearchByCategory(category,artistno);
		Page page = PagingUtil.getPage(pageno, countOfArt);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		page.setSearch(category);
		List<Art> artList = artdao.listByArt1(srn, ern, category,artistno);
		List<ArtDto.DtoForList> dtoList = new ArrayList<ArtDto.DtoForList>();
		for (Art art : artList) {
			ArtDto.DtoForList dto = modelMapper.map(art, ArtDto.DtoForList.class);
			dtoList.add(dto);
		}
			page.setArtList(dtoList);
		return page;

	}

	// 작품 리스트 최신순 + 작품이름으로 작품 검색 (회원용)
	public Page listFromUser(int pageno, @Nullable String artname, @Nullable String category,@Nullable String writer) {
		System.out.println("writer=="+writer);
		if(writer!=null) {
			Integer artistno = artistdao.findArtistnoByUsername(writer);
			int countOfArt = artdao.countSearchByCategory(category,artistno);
			Page page = PagingUtil.getPage(pageno, countOfArt);
			int srn = page.getStartRowNum();
			int ern = page.getEndRowNum();
			page.setSearch(category);
			List<Art> artList = artdao.listByArt1(srn, ern, category,artistno);
			List<ArtDto.DtoForList> dtoList = new ArrayList<ArtDto.DtoForList>();
			for (Art art : artList) {
				ArtDto.DtoForList dto = modelMapper.map(art, ArtDto.DtoForList.class);
				dtoList.add(dto);
			}
			page.setArtList(dtoList);
			return page;
		}
		int countOfArt = artdao.countSearchByArtNameCG(artname,category);
		Page page = PagingUtil.getPage2(pageno, countOfArt);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		page.setSearch(artname);
		List<Art> artList = artdao.listByArtFromUser(srn, ern, artname, category);
		List<ArtDto.DtoForList> dtoList = new ArrayList<ArtDto.DtoForList>();
		for (Art art : artList) {
			ArtDto.DtoForList dto = modelMapper.map(art, ArtDto.DtoForList.class);
			dtoList.add(dto);
		}
		page.setArtList(dtoList);
		if(category!=null)
			page.setCategory(category);
		return page;
	}

	// 리뷰 순 작품 정렬 (회원용)
	public Page listManyReview(int pageno, @Nullable String artname) {
		int countOfArt = artdao.countSerchByArtName(artname);
		Page page = PagingUtil.getPage2(pageno, countOfArt);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		page.setSearch(artname);
		List<Art> artList = artdao.listManyReviewByArt(srn, ern, artname);
		List<ArtDto.DtoForList> dtoList = new ArrayList<ArtDto.DtoForList>();
		for (Art art : artList) {
			ArtDto.DtoForList dto = modelMapper.map(art, ArtDto.DtoForList.class);
			dtoList.add(dto);
		}
		page.setArtList(dtoList);
		return page;
	}

	public Boolean paymentCheck(String username, String artName) {
		if(orderDetailDao.findArtnoByOrderDetail(artName)==null) {
			return false;
		}
		int orderno = orderDetailDao.findArtnoByOrderDetail(artName).getOrderno();
		// 주문테이블에 orderno로 username 있는지 체크
		return orderDao.findUsernameIsPay(orderno);
	}
}
