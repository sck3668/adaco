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
	
	
	public Shop readShopByArtistno(int artistno) {
		return sql.selectOne("shopMapper.readShopByArtistno", artistno);
	}
	
	
	
	public Shop readByShop(int shopno) {
		return sql.selectOne("shopMapper.readByShop", shopno);
	}
	
	
//	//상점 보기 혁지가 한거 아니에요
//	public Shop readByShop(int shopno) {
//		return sql.selectOne("shopMapper.findByShopno",shopno);
//	}
	
	//상점 수정
	public int updateByShop(Shop shop) {
		return sql.update("shopMapper.updateByShop",shop);
	}
	//상점 삭제
	public int deleteByShop(int shopno) {
		return sql.delete("shopMapper.delete",shopno);
	}
	
	
	//작품 등록에 필요
		public int readShopnoByArtistno(int artistno) {
			return sql.selectOne("shopMapper.readShopnoByArtistno", artistno);
		}
}
