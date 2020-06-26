package com.icia.adaco.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class shopDao {
	@Autowired
	private SqlSessionTemplate sql;
	
	public int writeByShop (Shop shop) {
		return sql.insert("shopMapper.insert",shop);
	}
	
	public Shop readByShop(int shopno) {
		return sql.selectOne("shopMapper.findByShopno",shopno);
	}
	
	public int updateByShop(Shop shop) {
		return sql.update("shopMapper.update",shop);
	}
	
	public int deleteByArt(int shopno) {
		return sql.delete("shopMapper.delete",shopno);
	}
}
