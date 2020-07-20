package com.icia.adaco.service.mvc;

import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.BagDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;

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
	@Autowired
	private ArtistDao artistDao;
	
	// 장바구니 추가
	public int insertByBag(Bag bag) {
		int artno = bag.getArtno();
		System.out.println("artno==========="+artno);
		System.out.println("art============"+artdao.readByArt(artno));
		Art art = artdao.readByArt(artno);
		
		bag.setTotalPrice(bag.getAmount()*art.getPrice());
		return bagdao.insertByBag(bag);
	}
	
	// 회원아이디로 장바구니 목록 불러오기
	public List<BagDto.DtoForList> findAllBagByUsername(String username) {
		BagDto.DtoForList dto1 = new BagDto.DtoForList();
		List<Bag> bagList = (List<Bag>) bagdao.findAllBagByUsername(username);
		List<BagDto.DtoForList> dtoList= new ArrayList<>();
		for(Bag bag1:bagList) {
			int artno = bag1.getArtno();
			Bag bag = bagdao.findByArtno(artno);
			Art art = artdao.readByArt(artno);
			Option option = optionDao.readByArtno(artno);
			BagDto.DtoForList dtoBag = modelMapper.map(bag1,BagDto.DtoForList.class);
			dtoBag.setArt(art);
			dtoBag.setOptionName(option.getOptionName()).setOptionValue(option.getOptionValue());
			dtoList.add(dtoBag);
		}
		return dtoList;
	}
	
	//재고여부 확인
	public boolean checkStock(int artno) {
		Bag bag = bagdao.findByArtno(artno);
		int stock = artdao.readByArt(artno).getStock();
		if(bag.getAmount()>=stock)
			throw new OutOfStockExcetion();
		return true;
	}
	
	// 개수 증감
	public Bag change(int artno, boolean isIncrese) {
		Bag bag = bagdao.findByArtno(artno);
		Art art = artdao.readByArt(artno);
		System.out.println("bag=="+bag);
		System.out.println("art=="+art);
		if(isIncrese==true) {
			bag.setAmount(bag.getAmount()+1);
			bag.setTotalPrice(bag.getAmount()*art.getPrice());
			bagdao.increaseByAmount(artno);
			bagdao.updateByBag(Bag.builder().artno(artno)
					.totalPrice(bag.getAmount()*art.getPrice()).build());
		} else {
			if(bag.getAmount()>1) {
			bag.setAmount(bag.getAmount()-1);
			bag.setTotalPrice(bag.getAmount()*art.getPrice());
			bagdao.decreaseByAmount(artno);
			bagdao.updateByBag(Bag.builder().artno(artno)
					.totalPrice(bag.getAmount()*art.getPrice()).build());
			}
		}
		return bag;
	}
	
	// 장바구니 index 찾기
	private int findBag(List<BagDto.DtoForList> bagList, int artno) {
		System.out.println("findBag artno========"+artno);
		System.out.println("findBag bagList========"+bagList);
		for (int i = 0; i < bagList.size(); i++) {
			if (bagList.get(i).getArtno() == artno) 
				return i;
		}
		return -1;
	}
	
	// 장바구니 삭제
	public List<DtoForList> deleteByBag(List<Integer> list, String username) {
		List<DtoForList> bagList = findAllBagByUsername(username);
		List<Integer> deleteList = new ArrayList<>();
		for(int i=0; i<list.size(); i++) {
			int idx = findBag(bagList, list.get(i));
			deleteList.add(idx);
		}
		for(int i = deleteList.size()-1; i>=0; i--) {
			int idx = deleteList.get(i);
			bagList.remove(idx);
			bagdao.deleteByBag(list.get(i));
		}
		return bagList;
	}
////////////////////////////////////////////////	
}