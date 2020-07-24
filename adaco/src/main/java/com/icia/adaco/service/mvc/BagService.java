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
	
	// 장바구니 추가
	public int insertByBag(Bag bag,String username) {
		int artno = bag.getArtno();
		Art art = artdao.readByArt(artno);
		bag.setTotalPrice(bag.getAmount()*(bag.getOptionPrice()+art.getPrice()));
		Bag bag1 = bagdao.findByArtnoUsername(artno,username);
		//username 찾은 장바구니의 artno가 추가하는 bag의 artno와 같은 경우 수량 증가
		// 장바구니 추가는 하지 않음
		if(bag1==null) {
			return bagdao.insertByBag(bag);
		} else {
			if(bag1.getArtno().equals(bag.getArtno())==true) {
				bag1.setAmount(bag.getAmount()+bag1.getAmount());
				bag1.setTotalPrice(bag.getTotalPrice()+bag1.getTotalPrice());
				return bagdao.updateByBagUsername(bag1);
			} else {
				return 1;
			}
		}
	}
	
	// 회원아이디로 장바구니 목록 불러오기
	public List<BagDto.DtoForList> findAllBagByUsername(String username) {
		List<Bag> bagList = (List<Bag>) bagdao.findAllBagByUsername(username);
		List<BagDto.DtoForList> dtoList= new ArrayList<>();
		for(Bag bag1:bagList) {
			int artno = bag1.getArtno();
			Art art = artdao.readByArt(artno);
			Option option = optionDao.readByArtno(artno);
			BagDto.DtoForList dtoBag = modelMapper.map(bag1,BagDto.DtoForList.class);
			dtoBag.setArt(art).setOptionName(option.getOptionName()).setOptionValue(option.getOptionValue());
			dtoList.add(dtoBag);
		}
		return dtoList;
	}
	
	//재고여부 확인
	public boolean checkStock(int artno,String username) {
		Bag bag = bagdao.findByArtnoUsername(artno, username);
		int stock = artdao.readByArt(artno).getStock();
		if(bag.getAmount()>=stock) {
			return false;
		}
		return true;
	}
	
	// 개수 증감
	public Bag change(int artno, boolean isIncrese,String username) {
		Bag bag = bagdao.findByArtnoUsername(artno, username);
		Art art = artdao.readByArt(artno);
		if(isIncrese==true) {
			bag.setAmount(bag.getAmount()+1);
			bag.setTotalPrice(bag.getAmount()*(art.getPrice()+bag.getOptionPrice()));
			bagdao.increaseByAmount(artno);
			bagdao.updateByBagUsername(Bag.builder().username(bag.getUsername()).artno(artno)
					.totalPrice(bag.getAmount()*(art.getPrice()+bag.getOptionPrice())).build());
		} else {
			if(bag.getAmount()>1) {
				bag.setAmount(bag.getAmount()-1);
				bag.setTotalPrice(bag.getAmount()*(art.getPrice()+bag.getOptionPrice()));
				bagdao.decreaseByAmount(artno);
				bagdao.updateByBagUsername(Bag.builder().username(bag.getUsername()).artno(artno)
					.totalPrice(bag.getAmount()*(art.getPrice()+bag.getOptionPrice())).build());
			}
		}
		return bag;
	}
	
	// 장바구니 index 찾기
	private int findBag(List<BagDto.DtoForList> bagList, int artno) {
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
}