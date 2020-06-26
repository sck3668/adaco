package com.icia.adaco.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class ShopDao {
	@Autowired
	private SqlSessionTemplate sql;
	//상점등록
	public int writeByShop (Shop shop) {
		return sql.insert("shopMapper.insert",shop);
	}
	//상점 보기
	public Shop readByShop(int shopno) {
		return sql.selectOne("shopMapper.findByShopno",shopno);
	}
	//상점 수정
	public int updateByShop(Shop shop) {
		return sql.update("shopMapper.update",shop);
	}
	//상점 삭제
	public int deleteByArt(int shopno) {
		return sql.delete("shopMapper.delete",shopno);
	}
}
