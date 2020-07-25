package com.icia.adaco.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class OptionDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	// 옵션 등록
	public int writeByOption(Option option) {
		return tpl.insert("optionMapper.insert",option);
	}
	
	// 옵션 삭제
	public int deleteByOption(int optno) {
		return tpl.delete("optionMapper.delete",optno);
	}
	
	// 옵션 수정
	public int updateByOption(Option option) {
		return tpl.update("optionMapper.update",option);
	}
	
	// 옵션 목록보기
	public List<Option> listByOption(){
		Map<String, Integer>map = new HashMap<>();
		return tpl.selectList("optionMapper.findAll",map);
	}
	
	// 작품번호로 검색한 옵션목록보기
	public List<Option> findAllByartno(int artno){
		return tpl.selectList("optionMapper.findAllByartno",artno);
	}

	// 옵션 보기
	public Option readByOption(Integer optno) {
		return tpl.selectOne("optionMapper.findById",optno);
	}
	// 작품번호로 옵션 보기
	public Option readOptionByArtno(Integer artno) {
		return tpl.selectOne("optionMapper.findOptionByArtno",artno);
	}
	
	// 작품 번호로 옵션 전체가져오기
	public Option readByArtno(Integer artno) {
		return tpl.selectOne("optionMapper.findByArtno",artno);
	}
	
	// 작품번호로 옵션번호 가져오기
	public int findOptnoByArtno(int artno) {
		return tpl.selectOne("optionMapper.findOptnoByArtno",artno);
	}
}
