package com.icia.adaco.service.mvc;

import java.io.*;
import java.time.format.*;
import java.util.*;
import java.util.regex.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.util.*;

import lombok.*;

@Service
public class AdminBoardService {
	@Autowired
	AdminBoardDao dao;
	@Autowired
	ModelMapper modelMapper;
	@Value("${imageFolder}")
	private String imageFolder;
	Pattern ckImagePattern = Pattern.compile("src=\".+\"\\s");
	
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

	public void deleteNoitce(Integer noticeno) {
		Notice notice = dao.findNoticeById(noticeno);
		if (notice == null)
			throw new JobFailException("공지사항을 찾을 수 없습니다.");
		String content = notice.getContent();
		Matcher matcher = ckImagePattern.matcher(content);
		while(matcher.find()) {
			String src = matcher.group();
			int start = src.indexOf("ckimage/");
			int end = src.indexOf("style=");
			String fileName = src.substring(start+8, end-2);
			File file = new File(imageFolder, fileName);
			if(file.exists()==true)
				file.delete();
		}
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
