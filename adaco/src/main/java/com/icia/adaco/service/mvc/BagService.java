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
	//	System.out.println("username========="+username);
		BagDto.DtoForList dto1 = new BagDto.DtoForList();
		List<Bag> bagList = (List<Bag>) bagdao.findAllBagByUsername(username);
	//	System.out.println("bagList=========="+bagList);
		List<BagDto.DtoForList> dtoList= new ArrayList<>();
		for(Bag bag1:bagList) {
	//		System.out.println("------------=========="+bag1);
			int artno = bag1.getArtno();
			Bag bag = bagdao.findByArtno(artno);
	//		System.out.println("bag============="+bag);
	//		System.out.println("artno============="+artno);
			Art art = artdao.readByArt(artno);
			List<Option> option = optionDao.findAllByartno(artno);
			//System.out.println("art==============="+art);
			//System.out.println("option============"+option);
			//System.out.println("bag1==============="+bag1);
			BagDto.DtoForList dtoBag = modelMapper.map(bag1,BagDto.DtoForList.class);
			//BagDto.DtoForList dtoArt = modelMapper.map(art,BagDto.DtoForList.class);
			//BagDto.DtoForList dtoOption = modelMapper.map(option,BagDto.DtoForList.class);
			//System.out.println("dtoBagq============"+dtoBag);
			//System.out.println("dtoArt==========="+dtoArt);
			//System.out.println("dtoOption==============="+dtoOption);
			dtoBag.setArt(art);
			dtoBag.setOption(option);
			dtoList.add(dtoBag);
		}
		System.out.println("00000000000"+dtoList+"============dtoList");
		
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
			//System.out.println("deleteService========"+list);
			//System.out.println(username);
			//bagdao.deleteByBag(artno);
			//System.out.println("list============="+list);
			//System.out.println("listSize=============="+list.size());
			
			List<DtoForList> bagList = findAllBagByUsername(username);
			//List<Bag> bagList = findAllByBag(artno);
			List<Integer> deleteList = new ArrayList<>();
			for(int i=0; i<list.size(); i++) {
				int idx = findBag(bagList, list.get(i));
				//System.out.println("list.get(i)========"+list.get(i));
				//System.out.println("idx1============="+idx);
				deleteList.add(idx);
			}
			for(int i = deleteList.size()-1; i>=0; i--) {
				int idx = deleteList.get(i);
				//System.out.println("idx2================"+idx);
				bagList.remove(idx);
				bagdao.deleteByBag(list.get(i));
			}
			//System.out.println("bagList============"+bagList);
			return bagList;
		}

		
////////////////////////////////////////////////	
	// 장바구니 추가
	public int insertByBag(String username,BagDto.DtoForWrite dto) {
		Bag bag = modelMapper.map(dto,Bag.class);
		Art art = modelMapper.map(dto,Art.class);
//		bagdao.findBagByUsername(username);
		return bagdao.insertByBag(bag);
	}
	//장바구니목록
	public List<Art> listByArt(int artno) {
		return artdao.list(artno);
	}
	
	
	// 장바구니 목록
	public List<Bag> findAllByBag(int artno){
		Art art = artdao.readByArt(artno);
		List<Art> list = new ArrayList<Art>();
		for(Art art1:list) {
			
		}
		return bagdao.findAllByBag();
	}

	/*
	 * 
	 * public List<Bag> findAllBagByUsername(String username) { Art art = (Art)
	 * artdao.findAllByUsername(username); List<Art> list = new ArrayList<Art>();
	 * for(Art art2:list) { } return bagdao.findAllBagByUsername(username); }
	 */
	
	
	// 장바구니 변경
	public void updateByBag(Bag bag) {
		bagdao.updateByBag(bag);
	}
	
	// 장바구니 작품 보기
	public void findByArtno(Integer artno) {
		bagdao.findByArtno(artno);
	}
}