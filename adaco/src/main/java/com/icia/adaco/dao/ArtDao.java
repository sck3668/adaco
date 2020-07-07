package com.icia.adaco.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.lang.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class ArtDao {
	@Autowired
	private SqlSessionTemplate tpl;
	////////////////////// 작가 전용 ///////////////////////////
	
	//작품 등록
	public int writeByArt(Art art) {
		return tpl.insert("artMapper.insert",art);
	}
	//사친 첨부
	public int multipartFile(Art art) {
		return tpl.insert("artMapper.insert",art);
	}
	// 작품 수정
	public int updateByArt(Art art) {
		return tpl.update("artMapper.update",art);
	}
	// 사진추가
	public int addBySajin(Art art) {
		return tpl.update("artMapper.update",art);
	}
	//대표사진수정
	public int updateByMainSajin(Art art) {
		return tpl.update("artMapper.update",art);
	}
	//사진 수정
	public int updateBySajin(Art art) {
		return tpl.update("artMapper.update",art);
	}
	
	//작품 내역 보기(최신순)
	public List<Art> listByArt(int startRowNum, int endRowNum){
		Map<String, Integer>map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("artMapper.findAll",map); 
	}
	
	
	//작품 삭제
	public int deleteByArt(int artno) {
		return tpl.delete("artMapper.delete",artno);
	}
	
	//작품상세 보기
	public Art readByArt(Integer artno) {
		return tpl.selectOne("artMapper.findById",artno);
	}
	
	//작품 조회수 증가
	public int updateByArtCnt(Art art) {
		return tpl.update("artMapper.update",art);
	}
	
	//포인트 적립????
	public int updateByPoint(Art art) {
		return tpl.update("artMapper.update",art);
	}
	
	//재고 수량 증감
	public int updateByArtCount(Art art) {
		return tpl.update("artMapper.update",art);
	}
	

	
	//작품 갯수
	public int countByArt() {
		return tpl.selectOne("artMapper.count");
	}
	
	////////////////////// 회원 전용 ///////////////////////////
	
	//작품 내역 보기(최신순) + 작품이름으로 검색 리스트
	public List<Art> listByArtFromUser(int startRowNum, int endRowNum, @Nullable String artname){
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum",endRowNum);
		map.put("artName", artname);
		return tpl.selectList("artMapper.findAllFromUser",map); 
	}

	//검색어에 해당되는 작품 수
	public int countSerchByArtName(String artname) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("artName", artname);
		return tpl.selectOne("artMapper.countSearchByArtName",map);
	}
	
	//일단 리뷰가 5이상인 작품 리스트
	public List<Art> listManyReviewByArt(int startRowNum, int endRowNum){
		Map<String, Integer>map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("artMapper.reviewManyByArt",map); 
	}
	
	//일단 리뷰가 5이상인 작품 수
	public int countReviewByArt() {
		return tpl.selectOne("artMapper.countReviewByArt");
	}
		
	// 작품 상세보기
		public Art readByArtFromUser(Integer artno) {
			return tpl.selectOne("artMapper.findByArtFromUser",artno);
		}
		
	//작품목록
		public List<Art> list(int artno) {
			return tpl.selectList("artMapper.list",artno);
		}
		
		public List<Art> findArtByUsername(String username) {
			return tpl.selectList("artMapper.findArtByUsername",username);
		}

}
