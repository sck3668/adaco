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
	// 장바구니 목록에 작품 추가
	public int insertByBag(Bag bag) {
		return tpl.insert("bagMapper.insertByBag", bag);
	}
	// 장바구니에  담아둔 작품의 총금액,수량,옵션명 옵션값 변경
	public int updateByBag(Bag bag) {
		return tpl.update("bagMapper.updateByBag", bag);
	}
	// 장바구니 담아둔 작품 삭제
	public int deleteByBag(Integer artno) {
		return tpl.delete("bagMapper.deleteByBag", artno);
	}
	// 장바구니 작품 상세
	public Bag findByArtno(Integer artno) {
		return tpl.selectOne("bagMapper.findByArtno", artno);
	}
	// 장바구니 목록 보기
	public List<Bag> findAllByBag(){
		return tpl.selectList("bagMapper.findAllByBag");
	}
	
}
