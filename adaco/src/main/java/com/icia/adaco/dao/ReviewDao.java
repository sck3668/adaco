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
	//작품 리뷰 작성 //메소드 이름 comment????
	public int writeByReviewOfArt(Review reviewcomment) {
		return tpl.insert("reviewMapper.insert", reviewcomment);
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
	

}
