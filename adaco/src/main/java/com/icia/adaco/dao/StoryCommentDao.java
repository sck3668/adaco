package com.icia.adaco.dao;

import javax.inject.*;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class StoryCommentDao {
	@Inject
	private SqlSessionTemplate tpl;
	public int insertByCommentOfStory(StoryComment storycomment) {
		return tpl.insert("CommentMapper.insert", storycomment);
	}
	
	public int deleteByCommentOfStory(int cno) {
		return tpl.delete("artCommentMapper.insert", cno);
	}
}
