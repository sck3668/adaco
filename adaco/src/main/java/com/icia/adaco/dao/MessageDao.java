package com.icia.adaco.dao;

import java.util.*;

import javax.inject.*;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class MessageDao {
	@Inject
	private SqlSessionTemplate tpl;
	
	//쪽지 목록 페이징 
	public int count() {
		return tpl.selectOne("messageMapper.count");
	}
	
	//쪽지 페이징 목록
	public List<Message> findAllMessage(int startRowNum, int endRowNum) {
		Map<String,Integer> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", startRowNum);
		return tpl.selectList("messageMapper.findAllMessage",map);
	}
	//쪽지 보내기
	public int insert(Message message) {
		return tpl.insert("messageMapper.insert", message);
	}
	//쪽지 삭제하기
	public int delete(int mno) {
		return tpl.delete("messageMapper.delete",mno);
	}
	
}
