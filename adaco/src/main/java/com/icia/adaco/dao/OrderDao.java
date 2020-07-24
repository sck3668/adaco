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
	
	//////작가용////
	
	//고객아이디로 하나의 주문 찾기
	public int orderFindByUsername1(String username) {
		return tpl.selectOne("orderMapper.orderFindByUsername",username);
	}
	
	public List<Bag> BagFindUsernameArtno(String username) {
		return tpl.selectList("orderMapper.BagFindUsernameArtno",username);
	}
	//유저네임으로 파인드올찾기 리스트불러오기
	public String orderShippingCharge(String username){
		return tpl.selectOne
				("orderMapper.orderShippingCharge",username);
	}
	//유저네임으로 배송비찾기
	public List<Order> findUsernameByCharge(String username) {
		return tpl.selectList("orderMapper.findUsernameByCharge",username);
	}
	
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
	
	////////작가 사용///////////
	//주문 번호로 주문자 찾기
	public String findUsernameByoderno(Integer orderno) {
		return tpl.selectOne("orderMapper.findUsernameByoderno", orderno);
	}
	
	//주문 번호로 주문일 찾기
	public String findOrderDateByoderno(Integer orderno) {
		return tpl.selectOne("orderMapper.findOrderDateByoderno", orderno);
	}
	
	//주문번호로 배송비 찾기//
	public int findShippingByoderno(Integer orderno) {
		return tpl.selectOne("orderMapper.findShippingByoderno", orderno);
	}
	
	public List<Integer> findBagnoByOrderno(int orderno) {
		return tpl.selectList("orderMapper.findBagnoByOrderno",orderno);
	}

	public Boolean findUsernameIsPay(int orderno) {
		return tpl.selectOne("orderMapper.findUsernameIsPay",orderno);
	}
}