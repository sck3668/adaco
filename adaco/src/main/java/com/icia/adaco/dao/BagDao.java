package com.icia.adaco.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class BagDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int insert(Bag bag) {
		return tpl.insert("bagMapper.insert", bag);
	}
	
	public int update(Bag bag) {
		return tpl.update("bagMapper.update", bag);
	}
	
	public int delete(Integer artno) {
		return tpl.delete("bagMapper.delete", artno);
	}
	
	
	
}
