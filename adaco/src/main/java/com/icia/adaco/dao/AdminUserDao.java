package com.icia.adaco.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class AdminUserDao {
	@Autowired
	private SqlSessionTemplate tpl;

//	유저 목록 카운팅
	public int countByUser(String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		return tpl.selectOne("adminUserMapper.countByUser", map);
	}
	
//	작가 목록 카운팅	
	public int countByArtist(String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		return tpl.selectOne("adminUserMapper.countByArtist", map);
	}
	
//	유저 목록 조회 (유저 이름으로 페이징)
	public List<User> findAllByUser(int startRowNum, int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("adminUserMapper.findAllByUser", map);
	}
	
//	유저 검색하기
	public List<User> findUserByKeyWord(int startRowNum, int endRowNum, String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("keyWord", keyWord);
		return tpl.selectList("adminUserMapper.findUserByKeyWord", map);
	}
	
//	작가 목록 조회 (작가 이름으로 페이징)
	public List<Artist> findAllByArtist(int startRowNum, int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("adminUserMapper.findAllByArtist", map);
	}
	
//	유저 블락 (판매자 유저)
	public int updateByUser(User user) {
		return tpl.update("adminUserMapper.updateByUser", user);
	}
	
}
