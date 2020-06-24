package com.icia.adaco.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class AdminBoardDao {
	@Autowired
	private SqlSessionTemplate tpl;

//	신고글 조회 (신고수로 페이징 인덱스 키 어케 써야 할 듯<미완성>)
	public List<Comment> findAllByReport(int startRowNum, int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("adminBoardMapper.findAllByReport", map);
	}
	
//	신고글 삭제 (체크해서 삭제하는거 가능하면 추가)
	public int deleteByReport(int cno) {
		return tpl.delete("adminBoardMapper.delete", cno);
	}
	
//	판매글 삭제
	public int deleteByArt(int artno) {
		return tpl.delete("adminBoardMapper.deleteByArt", artno);
	}
	
	public List<Question> findAllByQuestion(int startRowNum, int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("adminBoardMapper.findAllByQuestion", map);
	}
	
}
