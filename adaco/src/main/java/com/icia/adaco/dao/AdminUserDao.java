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
	public List<User> findAllByUser(int startRowNum, int endRowNum, String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("username", username);
		return tpl.selectList("adminUserMapper.findAllByUser", map);
	}
	
//	작가 목록 조회 (작가 이름으로 페이징)
	public List<Artist> findAllByArtist(int startRowNum, int endRowNum, String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("username", username);
		return tpl.selectList("adminUserMapper.findAllByArtist", map);
	}
	
//	유저 블락
	public int updateByUser(User user) {
		return tpl.update("adminUserMapper.updateByUser", user);
	}
	
//	유저 상세
	public User findByid(String username) {
		return tpl.selectOne("adminUserMapper.findById",username);
	}

//	유저 거래 내역 불러오기
	public List<String> findOrderById(String username) {
		return tpl.selectList("adminUserMapper.findOrderById", username);
	}
	
//	판매자 거래 내역 불러오기
	public List<String> findSellById(String username) {
		return tpl.selectList("adminUserMapper.findSellById", username);
	}
	
//	판매자 여부 확인
	public boolean existsByArtist(String username) {
		return tpl.selectOne("adminUserMapper.existsByArtist", username);
	}
}
