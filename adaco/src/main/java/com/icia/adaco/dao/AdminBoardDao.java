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
	
//	문의글 개수 카운팅
	public int countByQuestion(String writer, State searchType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("searchType", searchType);
		return tpl.selectOne("adminBoardMapper.countByQuestion", map);
	}
	
//	공지사항 개수 카운팅
	public int countByNotice(Boolean isImportant) {
		return tpl.selectOne("adminBoardMapper.countByNotice", isImportant);
	}
	
//	신고글 개수 카운팅
	public int countByReport() {
		return tpl.selectOne("adminBoardMapper.countByReport");
	}
	
//	신고글 조회
	public List<ArtComment> findAllByReport(int startRowNum, int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("adminBoardMapper.findAllByReport", map);
	}
	
//	신고글 삭제
	public int deleteByReport(List<Integer> cnos) {
		return tpl.delete("adminBoardMapper.deleteByReport", cnos);
	}
	
//	판매글 삭제
	public int deleteByArt(int artno) {
		return tpl.delete("adminBoardMapper.deleteByArt", artno);
	}
	
//	1:1 문의 등록
	public int insertByQuestion(Question question) {
		return tpl.insert("adminBoardMapper.insertByQuestion", question);
	}
		
//	1:1문의 페이징
	public List<Question> findAllByQuestion(int startRowNum, int endRowNum, String writer, State searchType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("writer", writer);
		map.put("searchType", searchType);
		return tpl.selectList("adminBoardMapper.findAllByQuestion", map);
	}
	
//	1:1 문의 읽기
	public Question findQuestionById(int qno) {
		return tpl.selectOne("adminBoardMapper.findQuestionById", qno);
	}
	
//	1:1 문의 답변
	public int updateQuestionByAnswer(Question question) {
		return tpl.update("adminBoardMapper.updateQuestionByAnswer", question);
	}
	
//	공지사항 작성
	public int insertByNotice(Notice notice) {
		return tpl.insert("adminBoardMapper.insertByNotice", notice);
	}
	
//	공지사항 목록	
	public List<Notice> findAllByNotice(int startRowNum, int endRowNum, Boolean isImportant) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("isImportant", isImportant);
		return tpl.selectList("adminBoardMapper.findAllByNotice", map);
	}
	
//	공지사항 읽기
	public Notice findNoticeById(Integer noticeno) {
		return tpl.selectOne("adminBoardMapper.findNoticeById", noticeno);
	}
		
//	공지사항 수정
	public int updateByNotice(Notice notice) {
		return tpl.update("adminBoardMapper.updateByNotice", notice);
	}
	
//	공지사항 삭제
	public int deleteByNotice(int noticeno) {
		return tpl.delete("adminBoardMapper.deleteByNotice", noticeno);
	}
	
//	FAQ 등록
	public int insertByFAQ(FAQ faq) {
		return tpl.insert("adminBoardMapper.insertByFAQ", faq);
	}
	
//	FAQ 목록 읽어오기 10개니까 페이징 안해ㅔ
	public List<FAQ> findAllByFAQ() {
		return tpl.selectList("adminBoardMapper.findAllByFAQ");
	}
	
//	FAQ 상세
	public FAQ findFAQById(int faqno) {
		return tpl.selectOne("adminBoardMapper.findFAQById", faqno);
	}
	
//	FAQ 업데이트
	public int updateByFAQ(FAQ faq) {
		return tpl.update("adminBoardMapper.updateByFAQ", faq);
	}
	
//	FAQ 삭제
	public int deleteByFAQ(int faqno) {
		return tpl.delete("adminBoardMapper.deleteByFAQ", faqno);
	}
	
//	카테고리 리스트
	public List<Category> findAllByCategory() {
		return tpl.selectList("adminBoardMapper.findAllByCategory");
	}
	
//	카테고리 등록
	public int insertByCategory(Category category) {
		return tpl.insert("adminBoardMapper.insertByCategory", category);
	}

//	카테고리 변경
	public int updateByCategory(Category category) {
		return tpl.update("adminBoardMapper.updateByCategory", category);
	}
	
//	카테고리 삭제
	public int deleteByCategory(String category) {
		return tpl.delete("adminBoardMapper.deleteByCategory", category);
	}
	
//	메시지 카운팅
	public int countMessageById(String recipientId) {
		return tpl.selectOne("adminBoardMapper.countMessageById", recipientId);
	}
	
//	안읽은 메시지 카운팅
	public int countNoReadMessageById(String recipientId) {
		return tpl.selectOne("adminBoardMapper.countNoReadMessageById", recipientId);
	}
}
