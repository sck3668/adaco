package com.icia.adaco.dao;

import java.util.*;

import javax.inject.*;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class StoryDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	//스토리 목록보기
	public List<Story> findAllStory(){
		return tpl.selectList("storyMapper.findAllStory");
	}
	//스토리 상세보기
	public Story findByStory(int storyno) {
		return tpl.selectOne("storyMapper.findByStory", storyno);
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
