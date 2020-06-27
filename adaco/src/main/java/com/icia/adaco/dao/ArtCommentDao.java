package com.icia.adaco.dao;



import java.util.*;

import javax.inject.*;
import javax.mail.*;

import org.apache.ibatis.session.*;
import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class ArtCommentDao {
	@Inject
	private SqlSessionTemplate tpl;
	//댓글 등록 
	public int writeByCommentOfArt(ArtComment artcomment) {
		return tpl.insert("artCommentMapper.insert", artcomment);
	}
	//댓글 삭제
	public int deleteByCommentOfArt(int cno) {
		return tpl.delete("artCommentMapper.delete", cno);
	}
	//댓글 목록 보기
	public List<Art> listByCommentOfArt(int startRowNum, int endRowNum){
		Map<String, Integer>map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("artCommentMapper.findAll",map); 
	}
	

}
