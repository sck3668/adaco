package com.icia.adaco.dao;

import java.util.*;

import javax.inject.*;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class StoryCommentDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	public int count() {
		return tpl.selectOne("storyCommentMapper.count");
	}
	
	//스토리 댓글 목록보기(페이징)
	public List<StoryComment> findAllByCno(int startRowNum, int endRowNum,int storyno){
		Map<String,Integer> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum",endRowNum);
		map.put("storyno", storyno);
		return tpl.selectList("storyCommentMapper.findAllByCno",map);
	}
	
	//스토리 댓글 목록
	public List<StoryComment> findAllByStoryno(int storyno) {
		return tpl.selectList("storyCommentMapper.findAllByStoryno",storyno);
	}
	
	// 댓글번호로 댓글 찾기
	public StoryComment findByCno(int cno) {
		return tpl.selectOne("storyCommentMapper.findByCno",cno);
	}
	//스토리 댓글 작성
	public int insertByCommentOfStory(StoryComment storyComment) {
		return tpl.insert("storyCommentMapper.insertByCommentOfStory",storyComment);
	}
	
	//스토리 댓글 삭제 (댓글 단 사람만 삭제 가능한지는 서비스에서 확인)
	public int deleteByCommentOfStory(int cno) {
		return tpl.delete("storyCommentMapper.deleteByCommentOfStory",cno);
	}
}
