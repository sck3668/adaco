package com.icia.adaco.controller.mvc;

import java.security.*;
import java.time.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;
import com.sun.istack.internal.*;

import lombok.*;

@Controller
public class AdminBoardController {
	
	@Autowired
	AdminBoardService service;
	@Autowired
	ObjectMapper objectMapper;
	
//	@PreAuthorize("isAuthenticated()")
//	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/report_list")
	public ModelAndView reportList(@RequestParam(defaultValue = "1")int pageno) {
		return new ModelAndView("admin/main").addObject("viewName", "admin/report_list.jsp").addObject("reportPage", service.reportList(pageno));
	}
	
//	@Secured("ROLE_ADMIN")
//	@PreAuthorize("isAuthenticated()")
	@GetMapping("/admin/question_list")
	public ModelAndView questionList(@RequestParam(defaultValue = "1")int pageno, @Nullable String writer, @Nullable State searchType) {
		return new ModelAndView("admin/question_list").addObject(service.questionList(pageno, writer, searchType));
	}
	
//	@Secured("ROLE_ADMIN")
//	@PreAuthorize("isAuthenticated()")
	@GetMapping("/admin/question_read")
	public ModelAndView qusetionRead(@RequestParam(value = "qno")@NonNull Integer qno) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("admin/question_read");
		AdminBoardDto.DtoForQuestionRead dto = service.questionRead(qno);
		String json = objectMapper.writeValueAsString(dto); 
		mav.addObject("question", json);
		return mav;
	}
	
//	@PreAuthorize("isAuthenticated()")
//	@Secured("ROLE_ADMIN")
	@PostMapping("/admin/question_answer")
	public String questionAnswer(Question question, Principal principal) {
		String answer = principal.getName();
		question.setAnswer(answer);
		question.setContent(question.getAnswerContent());
		service.questionAnswer(question);
		return "redirect:/admin/question_read?qno="+question.getQno();
	}
	
	@GetMapping("/admin/notice_list")
	public ModelAndView noticeList(@RequestParam(defaultValue = "1")int pageno, @Nullable Boolean isImportant) {
		return new ModelAndView("admin/noitce_list").addObject(service.noticeList(pageno, isImportant));
	}
	
//	@PreAuthorize("isAuthenticated()")
//	@Secured("ROLE_ADMIN")
	@PostMapping("/admin/notice_update")
	public String noticeUpdate(Notice notice) {
		service.noticeUpdate(notice);
		return "redirect:/admin/notice_read?qno="+notice.getNoticeno();
	}
	
//	@PreAuthorize("isAuthenticated()")
//	@Secured("ROLE_ADMIN")
	@DeleteMapping("/admin/notice_delete")
	public ResponseEntity<?> noticeDelete(Integer noticeno) {
		service.deleteNoitce(noticeno);
		return ResponseEntity.ok("/adaco/admin");
	}
	
	/* 유저 파트 일단 보류
	@GetMapping("/user/notice_read")
	public ModelAndView noticeRead(@RequestParam(value = "noticeno")@NonNull Integer noticeno) {
		ModelAndView mav = new ModelAndView("admin/notice_read");
		AdminBoardDto.DtoForNoticeRead dto = service.noticeRead(noticeno);
		String json =objectMapper.writeValueAsString(dto);
		mav.addObject("notice", json);
		return mav;
	}
	*/
}
