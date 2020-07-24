package com.icia.adaco.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	//작품 리뷰 작성 
	public int writeByReviewOfArt(Review review) {
		return tpl.insert("reviewMapper.insert", review);
	}
	
	//작품 리뷰 목록
	public List<Art> listByReviewOfArt(int startRowNum, int endRowNum){
		Map<String, Integer>map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("reviewMapper.findAll",map); 
	}
	
	//작품 리뷰 삭제
	public int deleteByReviewOfArt(int rno) {
		return tpl.delete("reviewMapper.delete",rno);
	}
	
	// username으로 리뷰 리스트 찾기
	public List<Art> listByReviewOfusername(String username){
		return tpl.selectList("reviewMapper.listByReviewOfusername",username);
	}
	
	//리뷰 상세(삭제 위한)
	public Review readByReviewOfArt(Integer rno) {
		return tpl.selectOne("reviewMapper.findById",rno);
	}
	
	//리뷰 갯수
	public int countByReviewOfArt() {
		return tpl.selectOne("reviewMapper.count");
	}
	
	//모든 리뷰 찾기
	public List<Review> findAllReview(int artno){
		return tpl.selectList("reviewMapper.findAllReview",artno);
	}
}	
