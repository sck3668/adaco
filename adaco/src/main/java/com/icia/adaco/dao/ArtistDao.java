package com.icia.adaco.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class ArtistDao {
	@Autowired
	private SqlSessionTemplate sql;
	
	public Artist findByid(int artistno) {
		return sql.selectOne("artistMapper.findById",artistno);
	}
	public int insert (Artist artist) {
		return sql.insert("artistMapper.insert",artist);
	}
	public int update (Artist artist) {
		return sql.update("artistMapper.update",artist);
	}
	public int delete(int artistno) {
		return sql.delete("artistMapper.delete",artistno);
	}
	
	public Integer findArtistnoByUsername(String username) {
		return sql.selectOne("artistMapper.findArtistnoByUsername",username);
	}
}