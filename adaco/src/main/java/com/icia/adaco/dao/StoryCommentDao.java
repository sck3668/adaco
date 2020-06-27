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
	//스토리 댓글 목록보기
	public List<StoryComment> findAllByCno(int startRowNum, int endRowNum){
		Map<String,Integer> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("storyCommentMapper.findAllByCno",map);
	}
	
	//스토리 댓글 작성
	public int insertByCommentOfStory(StoryComment storycomment) {
		return tpl.insert("storyCommentMapper.insertByCommentOfStory", storycomment);
	}
	
	//스토리 댓글 삭제 (댓글 단 사람만 삭제 가능한지는 서비스에서 확인)
	public int deleteByCommentOfStory(int cno) {
		return tpl.delete("storyCommentMapper.deleteByCommentOfStory",cno);
	}
}
