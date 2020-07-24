package com.icia.adaco.dao;

import java.util.*;

import javax.inject.*;

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
	public List<ArtComment> listByCommentOfArt(int artno){
		return tpl.selectList("artCommentMapper.findAll", artno); 
	}
	
	//댓글 상세보기
	public ArtComment readByCommentOfArt(Integer cno) {
		return tpl.selectOne("artCommentMapper.findById",cno);
	}
	
	//신고수 업데이트
	public int updateByReportCnt(int cno) {
		return tpl.update("artCommentMapper.update", cno);
	}
}
