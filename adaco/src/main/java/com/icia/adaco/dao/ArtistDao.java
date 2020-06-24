package com.icia.adaco.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.*;

@Repository
public class ArtistDao {
	@Autowired
	private SqlSessionTemplate sql;
	public boolean existsUsername(String username) {
		return sql.selectOne("artistMapper.existsUsername",username);
	}
	public boolean existsEmail(String email) {
		return sql.selectOne("artistMapper.existsEmail",email);
	}
	public String findidByCheckTel(String tel) {
		return sql.selectOne("artistMapper.findidByCheckTel",tel);
	}
	public String findidByCheckName(String irum) {
		return sql.selectOne("artistMapper.findidByCheckName",irum);
	}
	public String findidByCheckEmail(String email) {
		return sql.selectOne("artistMapper.findidByCheckEmail",email);
	}
	public Artist findByid(int artistno) {
		return sql.selectOne("artistMapper.findById",artistno);
	}
	public int insert (Artist artist) {
		return sql.insert("artistMapper.insert",artist);
	}
	public int update (Artist artist) {
		return sql.update("artistMapper.update",artist);
	}
	public Artist findShopNoByid(int shopno) {
		return sql.selectOne("artistMapper.findShopNoByid",shopno);
	}
	public int delete(int artistno) {
		return sql.delete("artistMapper.delete",artistno);
	}
}
