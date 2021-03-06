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

	public int count() {
		return tpl.selectOne("adminBoardMapper.countByReport");
	}
//	신고글 조회
	public List<ArtComment> findAllByReport(int startRowNum, int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("adminBoardMapper.findAllByReport", map);
	}
	
//	신고글 삭제 (체크해서 삭제하는거 가능하면 추가)
	public int deleteByReport(int cno) {
		return tpl.delete("adminBoardMapper.deleteByReport", cno);
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
	public List<Question> findAllByQuestion(int startRowNum, int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("adminBoardMapper.findAllByQuestion", map);
	}
	
//	1:1문의 작성자 검색 & 페이징인데 아직 못함 추가해야됨 )))))))
	public void findQuestionById() {
		
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
	
//	중요 공지 작성인데 mapper 안만듦. 어케해야될까? )))))))))
	public int insertByMostNotice(Notice notice) {
		return tpl.insert("adminBoardMapper.insertByMostNotice", notice);
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
	
//	카테고리 등록
	public int insertByCategory(Category category) {
		return tpl.insert("adminBoardMapper.insertByCategory", category);
	}

//	카테고리 변경 ))))))))))))) 컬럼 하나라서 사실상 불가  번호추가 해야할듯
	public int updateByCategory(Category category) {
		return tpl.update("adminBoardMapper.updateByCategory", category);
	}
	
//	카테고리 삭제
	public int deleteByCategory(String category) {
		return tpl.delete("adminBoardMapper.deleteByCategory", category);
	}
}
