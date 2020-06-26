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
	
	public int insert(Order orderNo) {
		return tpl.insert("orderMapper.insert", orderNo);
	}
	
	public int update(Order orderNo) {
		return tpl.update("orderMapper.update", orderNo);
	}
	
	public int delete(Integer orderno) {
		return tpl.delete("orderMapper.delete", orderno);
	}
	
	public Order findById(Integer orderno) {
		return tpl.selectOne("orderMapper.findById", orderno);
	}
	
	public List<Order> findAllOrder() {
		return tpl.selectList("orderMapper.findAllOrder");
	}
}
