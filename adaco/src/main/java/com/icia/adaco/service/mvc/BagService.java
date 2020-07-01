package com.icia.adaco.service.mvc;

import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;

@Service
public class BagService {
	
	@Autowired
	private BagDao bagdao;
	@Autowired
	private ArtDao artdao;
	@Autowired
	private OptionDao optionDao;
	@Autowired
	private ModelMapper modelMapper;
	
	// 장바구니 추가
	public void insertByBag(String username,BagDto.DtoForWrite dto,Integer artno,Option option,Art art) {
		Bag bag = modelMapper.map(dto,Bag.class);
		artdao.writeByArt(art);
		optionDao.writeByOption(option);
		bagdao.findBagByUsername(username);
		bagdao.insertByBag(bag);
		
	}
	
	// 장바구니 목록
	public List<Bag> findAllByBag(){
		return bagdao.findAllByBag();
	}
	
	// 장바구니 삭제
	public void deleteByBag(Integer artno) {
		bagdao.deleteByBag(artno);
	}
	
	// 장바구니 변경
	public void updateByBag(Bag bag) {
		bagdao.updateByBag(bag);
	}
	
	// 장바구니 작품 보기
	public void findByArtno(Integer artno) {
		bagdao.findByArtno(artno);
	}
}
