package com.icia.adaco.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class BagDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	// 장바구니 목록에 작품 추가---------------
	public int insertByBag(Bag bag) {
		return tpl.insert("bagMapper.insertByBag", bag);
	}
	
	// 회원아이디로 장바구니 목록 불러오기
	public List<Bag> findAllBagByUsername(String username) {
		return tpl.selectList("bagMapper.findAllByUsername",username);
	}
	
	// 장바구니 수량 증가
	public int increaseByAmount(int artno) {
		return tpl.update("bagMapper.increaseByAmount",artno);
	}
	
	// 장바구니 수량 감소
	public int decreaseByAmount(int artno) {
		return tpl.update("bagMapper.decreaseByAmount",artno);
	}
	
	// 작품번호로 장바구니에 담긴 작품 보기
	public Bag findByArtno(Integer artno) {
		return tpl.selectOne("bagMapper.findByArtno", artno);
	}
	// 작품번호와 아이디로 장바구니 작품 보기
	public Bag findByArtnoUsername(Integer artno,String username) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("artno",artno);
		map.put("username",username);
		return tpl.selectOne("bagMapper.findByArtnoUsername", map);
	}
	// 장바구니에  담아둔 작품의 총금액,수량,옵션명 옵션값 변경
	public int updateByBag(Bag bag) {
		return tpl.update("bagMapper.updateByBag", bag);
	}
	
	// 장바구니에  담아둔 작품의 총금액,수량,옵션명 옵션값 변경
	public int updateByBagUsername(Bag bag) {
		return tpl.update("bagMapper.updateByBagUsername", bag);
	}
	
	// 장바구니 담아둔 작품 삭제
	public int deleteByBag(Integer artno) {
		return tpl.delete("bagMapper.deleteByBag", artno);
	}
	// 장바구니 번호로 작품번호 찾기
	public int findArtnoByBagno(int bagno) {
		return tpl.selectOne("bagMapper.findArtnoByBagno",bagno);
	}
	
	// username으로 장바구니 찾기
	public Bag findBagByUsername(String username) {
		return tpl.selectOne("bagMapper.findBagByUsername",username);
	}
}
