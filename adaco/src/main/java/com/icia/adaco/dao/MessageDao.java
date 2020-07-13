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

	public List<Message> findAllBySender(String username) {
		return tpl.selectList("messageMapper.findAllBySender", username);
	}

	public List<Message> findAllByReceiver(String username) {
		return tpl.selectList("messageMapper.findAllByReceiver", username);
	}

	public Message findById(Integer mno) {
		return tpl.selectOne("messageMapper.findById", mno);
	}
	
	public int setRead(Integer mno) {
		return tpl.update("messageMapper.setRead", mno);
	}
	
	//쪽지 삭제하기
	public int delete() {
		return tpl.delete("messageMapper.delete");
	}
	
	public int disableBySender(List<Integer> list) {
		return tpl.update("messageMapper.disableBySender", list);
	}
	public int disableByReceiver(List<Integer> list) {
		return tpl.update("messageMapper.disableByReceiver", list);
	}

}
