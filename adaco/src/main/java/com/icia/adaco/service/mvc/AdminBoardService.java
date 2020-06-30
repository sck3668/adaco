package com.icia.adaco.service.mvc;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.adaco.dao.AdminBoardDao;
import com.icia.adaco.dto.AdminBoardDto;
import com.icia.adaco.dto.Page;
import com.icia.adaco.entity.ArtComment;
import com.icia.adaco.entity.FAQ;
import com.icia.adaco.entity.Notice;
import com.icia.adaco.entity.Question;
import com.icia.adaco.entity.State;
import com.icia.adaco.exception.QuestionNotFoundException;
import com.icia.adaco.util.PagingUtil;

import lombok.NonNull;

@Service
public class AdminBoardService {
	@Autowired
	AdminBoardDao dao;
	@Autowired
	ModelMapper modelMapper;

	
	public Page reportList(int pageno) {
		int countOfReport = dao.countByReport();
		Page page = PagingUtil.getPage(pageno, countOfReport);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<ArtComment> reportList = dao.findAllByReport(srn, ern);
		List<AdminBoardDto.DtoForReportList> dtoList = new ArrayList<AdminBoardDto.DtoForReportList>();
		for(ArtComment comment:reportList) {
			AdminBoardDto.DtoForReportList dto = modelMapper.map(comment, AdminBoardDto.DtoForReportList.class);
			dto.setWriteDateStr(comment.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dtoList.add(dto);
		}
		page.setAdminReportList(dtoList);
		return page;
	}

	public Page questionList(int pageno, String writer, State searchType) {
		int countOfQuestion = dao.countByQuestion(writer, searchType);
		Page page = PagingUtil.getPage(pageno, countOfQuestion);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Question> questionList = dao.findAllByQuestion(srn, ern, writer, searchType);
		List<AdminBoardDto.DtoForQuestionList> dtoList = new ArrayList<AdminBoardDto.DtoForQuestionList>();
		for(Question question:questionList) {
			AdminBoardDto.DtoForQuestionList dto = modelMapper.map(question, AdminBoardDto.DtoForQuestionList.class);
			dto.setWriteDateStr(question.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dtoList.add(dto);
		}
		page.setAdminQuestionList(dtoList);
		return page;
	}

	public AdminBoardDto.DtoForQuestionRead questionRead(@NonNull Integer qno) {
		Question question = dao.findQuestionById(qno);
		if(question == null)
			throw new QuestionNotFoundException();
		AdminBoardDto.DtoForQuestionRead dto = modelMapper.map(question, AdminBoardDto.DtoForQuestionRead.class);
		String writeDateStr = question.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
		if(question.getAnswerContent()!= null) {
			String answerDateStr = question.getAnswerDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
			dto.setAnswerDateStr(answerDateStr);			
		}
		dto.setWriteDateStr(writeDateStr);
		return dto;
	}

	public void questionAnswer(Question question) {
		question.setState(State.답변완료);
//		메시지 보내기 추가예정
		dao.updateQuestionByAnswer(question);
	}

	public Page noticeList(int pageno, Boolean isImportant) {
		int countOfNotice = dao.countByNotice(isImportant);
		Page page = PagingUtil.getPage(pageno, countOfNotice);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Notice> noticeList = dao.findAllByNotice(srn, ern, isImportant);
		List<AdminBoardDto.DtoForNoticeList> dtoList = new ArrayList<AdminBoardDto.DtoForNoticeList>();
		for(Notice notice:noticeList) {
			AdminBoardDto.DtoForNoticeList dto = modelMapper.map(notice, AdminBoardDto.DtoForNoticeList.class);
			dto.setWriteDateStr(notice.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dtoList.add(dto);
		}
		page.setAdminNoticeList(dtoList);
		return page;
	}

	public void noticeUpdate(Notice notice) {
		dao.updateByNotice(notice);	
	}

	public List<FAQ> faqList() {
		return dao.findAllByFAQ();
	}

	public int faqWrite(FAQ faq) {
		dao.insertByFAQ(faq);
		return faq.getFaqno();
	}

	public void reportDelete(List<Integer> cnos) {
		dao.deleteByReport(cnos);
	}



	/* 유저 파트 일단 보류
	public DtoForNoticeRead noticeRead(@NonNull Integer noticeno) {
		Notice notice = dao.findno(qno);
		if(question == null)
			throw new QuestionNotFoundException();
		AdminBoardDto.DtoForQuestionRead dto = modelMapper.map(question, AdminBoardDto.DtoForQuestionRead.class);
		String writeDateStr = question.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
		if(question.getAnswerContent()!= null) {
			String answerDateStr = question.getAnswerDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
			dto.setAnswerDateStr(answerDateStr);			
		}
		dto.setWriteDateStr(writeDateStr);
		return dto;
	}
	*/
}
