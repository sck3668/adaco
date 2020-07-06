package com.icia.adaco.dao;


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
		return tpl.selectOne("orderDetailMapper.OrderDetail", orderno);
	}
	
	
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
