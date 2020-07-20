package com.icia.adaco.dao;


import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class OrderDetailDao {
	
	@Autowired
	SqlSessionTemplate tpl;

	// 결제하기
	public int Payment(OrderDetail orderdetail) {
		return tpl.insert("orderDetailMapper.Payment", orderdetail);
	}
	
	// 주문 상세
	public OrderDetail OrderDetail(Integer orderno) {
		System.out.println("Dao."+orderno);
		return tpl.selectOne("orderDetailMapper.OrderDetail", orderno);
	}
	// Artno로 디테일 찾기
	public OrderDetail findArtnoByOrderDetail(String artName) {
		System.out.println("4444");

		return tpl.selectOne("orderDetailMapper.findArtnoByOrderDetail",artName);
	}
	// ArtName으로 이미지찾기
	public String findByArtnameArtImage(String artName) {
		System.out.println("333333");

		return tpl.selectOne("orderDetailMapper.findByArtnameArtImage",artName);
	}
	
	///////////작가 전용//////////////////
	
	// 작가 번호로 주문 내역 찾기
	public List<Integer> orderFindByArtistno(int artistno) {
		return tpl.selectList("orderDetailMapper.findAllOrderByArtist",artistno);
	}
	
	//주문 갯수
	public int countByOrder() {
		return tpl.selectOne("orderDetailMapper.count");
	}
	
	// 작가번호로 주문내역 리스트
	public List<OrderDetail> FindAllOrderByArtist(int startRowNum,int endRowNum,int artistno) {
		System.out.println("dao=====");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("artistno",artistno);
	return tpl.selectList("orderDetailMapper.findAllOrderByArtist",map);
	}
	
	//
	
	
	
//	// 결제 취소
//	public int deleteByOrderDetail(int orderno) {
//	return tpl.delete("orderDetailMapper.delete", orderno);
//	}
	
//	// 모든 주문 내역 
//	public List<OrderDetail> OrderByAll(int startRowNum, int endRowNum){
//		Map<String, Integer>map = new HashMap<>();
//		map.put("startRowNum", startRowNum);
//		map.put("endrowum", endRowNum);
//		return tpl.selectList("orderDetailMapper.OrderByAll", map);
//	}
	
	//	 주문 상세 내역 
//	public OrderDetail findOrderByDetail(int orderno){
//		return tpl.selectOne("orderDetailMapper.findOrderByDetail", orderno);
//	}
}
