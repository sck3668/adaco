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
	public int orderFindByUsername(String username) {
		return tpl.selectOne("orderMapper.orderFindByUsername",username);
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
	public List<Order> findAllByOrder(int startRowNum,int endRowNum) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum", endRowNum);
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
}