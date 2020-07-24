package com.icia.adaco.dao;


import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.lang.*;
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
		return tpl.selectOne("orderDetailMapper.OrderDetail", orderno);
	}
	
	// Artno로 디테일 찾기
	public OrderDetail findArtnoByOrderDetail(String artName) {
		return tpl.selectOne("orderDetailMapper.findArtnoByOrderDetail",artName);
	}
	
	// ArtName으로 이미지찾기
	public String findByArtnameArtImage(String artName) {
		return tpl.selectOne("orderDetailMapper.findByArtnameArtImage",artName);
	}
	
	// Orderno 로 디테일 찾기
	public OrderDetail findByOrdernoOrderDetail(int orderno) {
		return tpl.selectOne("orderDetailMapper.findByOrdernoOrderDetail",orderno);
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
	
	// 작가번호로 주문내역 리스트 + 주문상태로 검색
	public List<OrderDetail> FindAllOrderByArtist(int startRowNum,int endRowNum,int artistno,@Nullable String orderstate) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("artistno",artistno);
		map.put("orderstate",orderstate);
		return tpl.selectList("orderDetailMapper.findAllOrderByArtist",map);
	}
	
	// 주문상태 업데이트
	public int updateByOrderDetail(OrderDetail orderDetail) {
		return tpl.update("orderDetailMapper.update",orderDetail);
	}
	
	//검색어에 해당되는 작품 수
	public int countSearchByState(String orderstate) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("orderstate",orderstate);
		return tpl.selectOne("orderDetailMapper.countSearchByState",map);
	}
}
