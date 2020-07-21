package com.icia.adaco.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class OrderDao {
	@Autowired
	private SqlSessionTemplate tpl;
	public List<Integer> orderFindByUsername(String username) {
		return tpl.selectList("orderMapper.orderFindByUsername",username);
	}
	public List<Bag> BagFindUsernameArtno(String username) {
		return tpl.selectList("orderMapper.BagFindUsernameArtno",username);
	}
	//유저네임으로 아트 찾기
	/*
	 * public String ArtNameByUsername(String username) { return
	 * tpl.selectOne("orderMapper.ArtNameByUsername",username); } public String
	 * ArtPriceByUsername(String username) { return
	 * tpl.selectOne("orderMapper.ArtPriceByUsername",username); }
	 */
	
	//유저네임으로 검색
	public int count(String username) {
		return tpl.selectOne("orderMapper.count",username);
	}
	
	// 주문  하기
	public int Ordering(Order order) {
		return tpl.insert("orderMapper.Ordering", order);
	}
	
	// 주문 내역 보기
	public List<Order> findAllByOrder(int startRowNum,int endRowNum,String username) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("username",username);
	return tpl.selectList("orderMapper.findAllByOrder",map);
	}
	
	// 주문 상세 보기
	public Order findByOrder(Integer orderno) {
		return tpl.selectOne("orderMapper.findByOrder", orderno);
	}
	
//	// 주문 내역 변경
//	public int updateByOrder(Order orderno) {
//		return tpl.update("orderMapper.updateByOrder", orderno);
//	}
	
	// 주문 취소
	public int deleteByOrder(int orderno) {
		return tpl.delete("orderMapper.deleteByOrder", orderno);
	}

	// 회원아이디로 주문번호 찾기
	public int findOrdernoByUsername(String username,int bagno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("bagno",bagno);
		return tpl.selectOne("orderMapper.findOrdernoByUsername",map);
	}
	public List<Integer> findBagnoByOrderno(int orderno) {
		return tpl.selectList("orderMapper.findBagnoByOrderno",orderno);
	}
}