package com.icia.adaco.dao;

import java.util.*;

import javax.inject.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.lang.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;
@Repository
public class StoryDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	//스토리 목록보기
	public int count () {
		return tpl.selectOne("storyMapper.count");
	}
	
	public List<Story> findAllStory(int startRowNum, int endRowNum,@Nullable Integer artistno){
		Map<String,Integer> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum",endRowNum);
		map.put("artistno",artistno);
		return tpl.selectList("storyMapper.findAllStory", map);
	}
	
	//스토리 상세보기
	public Story findByStory(int storyno) {
		return tpl.selectOne("storyMapper.findByStory", storyno);
	}
	
	public int update(Story story) {
		return tpl.update("storyMapper.update",story);
	}
	
	//스토리 작성
	public int insert(Story story) {
		return tpl.insert("storyMapper.insert", story);
	}
	
	//스토리삭제
	public int delete(int storyno) {
		return tpl.delete("storyMapper.delete", storyno);
	}
}
