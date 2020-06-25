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
	//메시지 목록보기
	public List<Message> findAllMessage() {
		return tpl.selectList("messageMapper.findAll");
	}
	//메시지 보내기
	public int insert(Message message) {
		return tpl.insert("messageMapper.insert", message);
	}
	//메시지 삭제하기
	public int delete(int mno) {
		return tpl.delete("messageMapper.delete",mno);
	}
	
}
