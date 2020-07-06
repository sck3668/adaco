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
	
	// 주문  하기
	public int Ordering(Order order) {
		return tpl.insert("orderMapper.Ordering", order);
	}
	
	// 주문 내역 보기
	public List<Order> findAllByOrder() {
		return tpl.selectList("orderMapper.findAllByOrder");
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