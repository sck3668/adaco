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
	
	// 주문 목록에 추가
	public int insertByOrder(Order orderNo) {
		return tpl.insert("orderMapper.insertByOrder", orderNo);
	}
	// 주문 내역 변경
	public int updateByOrder(Order orderNo) {
		return tpl.update("orderMapper.updateByOrder", orderNo);
	}
	// 주문 내역 삭제
	public int deleteByOrder(Integer orderno) {
		return tpl.delete("orderMapper.deleteByOrder", orderno);
	}
	// 주문 상세 보기
	public Order findByOrderno(Integer orderno) {
		return tpl.selectOne("orderMapper.findByOrderno", orderno);
	}
	// 주문 목록 보기
	public List<Order> findAllByOrder() {
		return tpl.selectList("orderMapper.findAllByOrder");
	}
}
