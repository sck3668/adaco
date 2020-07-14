package com.icia.adaco.service.mvc;

import java.io.*;
import java.time.*;
import java.time.format.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.util.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.AdminBoardDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.util.*;

import lombok.*;

@Service
public class AdminBoardService {
	@Autowired
	AdminBoardDao dao;
	@Autowired
	AdminUserDao userDao;
	@Autowired
	AttachmentDao attachmentDao;
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
		page.setState(searchType);
		page.setSearch(writer);
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
		String answer = question.getAnswer();
		String answerContent = question.getAnswerContent();
		question = dao.findQuestionById(question.getQno());
		if(question == null)
			throw new JobFailException("아 못찾겠습니다.");
		question.setState(State.답변완료);
		question.setAnswer(answer);
		question.setAnswerContent(answerContent);
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

	public int write(AdminBoardDto.DtoForNoticeWrite dto) throws IOException {
		Notice notice = modelMapper.map(dto, Notice.class);
		if(dto.getAttachments()!=null) 
			notice.setAttachmentCnt(dto.getAttachments().size());
		else
			notice.setAttachmentCnt(0);
		dao.insertByNotice(notice);
		
		List<MultipartFile> attachments = dto.getAttachments();
		List<Attachment> list = new ArrayList<Attachment>();
		if(attachments != null) {
			for(MultipartFile mf:attachments) {
				Attachment a = new Attachment();
				String originalFileName = mf.getOriginalFilename();
				long time = System.currentTimeMillis();
				String saveFileName = time + "-" + originalFileName;
				boolean isImage = mf.getContentType().toLowerCase().startsWith("image/");
				a.setNoticeno(notice.getNoticeno()).setImage(isImage).setLength((int)mf.getSize()).setOriginalFileName(originalFileName)
					.setSaveFileName(saveFileName).setWriter(notice.getWriter());
				File file = new File("d:/upload/attachment", saveFileName);
				FileCopyUtils.copy(mf.getBytes(), file);
				attachmentDao.noticeInsert(a);
			}
		}
		return notice.getNoticeno();
	}

	public AdminBoardDto.DtoForNoticeRead noticeRead(@NonNull Integer noticeno) {
		Notice notice = dao.findNoticeById(noticeno);
		if(notice == null)
			throw new JobFailException("해당 글을 찾을 수 없습니다.");
		AdminBoardDto.DtoForNoticeRead dto = modelMapper.map(notice, AdminBoardDto.DtoForNoticeRead.class);
		String str = notice.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
		dto.setWriteDateStr(str);
		
		if(notice.getAttachmentCnt()>0)
			dto.setAttachments(attachmentDao.findAllNoticeByNoticeno(noticeno));

		return dto;
	}

	public AdminBoardDto.DtoForIndex indexRead() {
		AdminBoardDto.DtoForIndex dto = new DtoForIndex();
		dto.setCountByQuestion(dao.countByQuestion(null, null));
		dto.setCountByNoAnswerQuestion(dao.countByQuestion(null, State.답변대기));
		dto.setCountByUser(userDao.countByUser(null));
		dto.setCountByArtist(userDao.countByArtist(null));
		return dto;
	}

	public void faqDelete(Integer faqno) {
		dao.deleteByFAQ(faqno);
	}

	public int questionWrite(Question question, String username) {
		question.setWriter(username).setWriteDate(LocalDateTime.now()).setState(State.답변대기);
		dao.insertByQuestion(question);
		return question.getQno();
	}

	public List<Category> categoryList() {
		return dao.findAllByCategory();
	}

}
