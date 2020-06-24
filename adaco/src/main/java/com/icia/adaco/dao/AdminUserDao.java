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

//	유저 목록 조회 (유저 이름으로 페이징)
	public List<User> findAllByUser(int startRowNum, int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("adminUserMapper.findAllByUser", map);
	}
	
//	유저 검색 기능 (아직 안배움)
	public int countByUser(String username) {
		return tpl.selectOne("adminUserMapper.countByUser", writer);
	}

//	작가 목록 조회 (작가 이름으로 페이징) -> 아이디, 이름, 이메일 확인해야 하는데 작가 테이블 내에 없음. 조인 필요한데 페이징이라 힘듦
	public List<Artist> findAllByArtist(int startRowNum, int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("adminUserMapper.findAllByArtist", map);
	}
	
//	작가 검색 기능 (유저랑 작가랑 통합하면 좋은데 테이블이 따로라서 조인 필요 이거 됨?)
	public int countByArtist(String username) {
		return tpl.selectOne("adminUserMapper.countByArtist", username);
	}
	
//	유저 블락
	public int updateByUser(User user) {
		return tpl.update("adminUserMapper.updateByUser", user);
	}
	
//	권한 부여하기 (맵으로 넘겼는데 됨? 테스트 필요 / 안되면 dao 따로 만들면 됨)
	public int insertByAuthority(String username, String authority) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("authority", authority);
		return tpl.insert("adminUserMapper.insertByAuthority", map);		
	}
	
//	권한 변경하기 (위와 같음)
	public int updateByAuthority(String username, String authority) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("authority", authority);
		return tpl.update("adminUserMapper.updateByAuthority", map);
	}
	
	
}
