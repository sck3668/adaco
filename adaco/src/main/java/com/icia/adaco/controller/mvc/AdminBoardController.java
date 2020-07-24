package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;
import java.util.*;

import javax.servlet.http.*;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.math.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.lang.Nullable;
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
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/")
	public ModelAndView adminIndex(Principal principa) {
		return new ModelAndView("admin/index").addObject("index", service.indexRead(principa.getName()));
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/report_list")
	public ModelAndView reportList(@RequestParam(defaultValue = "1")int pageno) {
		return new ModelAndView("admin/report/list").addObject("reportPage", service.reportList(pageno));
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/admin/report_delete")
	public String reportDelete(@RequestParam @NotNull String cnos) {
		List<Integer> list = new ArrayList<>();
		String[] strings = cnos.split(",");
		for(String str:strings) {
			list.add(NumberUtils.toInt(str));
		}
		service.reportDelete(list);
		return "redirect:/admin/report_list";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/questionWrite")
	public ModelAndView questionWrite() {
		return new ModelAndView("main").addObject("viewName", "admin/question/write.jsp");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/admin/question_write")
	public String questionWrite(Question question, Principal principal) {
		String username = principal.getName();
		return "redirect: /adaco/admin/question_read?qno="+service.questionWrite(question, username);
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/question_list")
	public ModelAndView questionList(@RequestParam(defaultValue = "1")int pageno, @Nullable String writer, @Nullable State searchType) {
		return new ModelAndView("admin/question/list").addObject("questionPage", service.questionList(pageno, writer, searchType));
	}
	
	@GetMapping("/user/questionList")
	public ModelAndView userQuestionList(@RequestParam(defaultValue = "1")int pageno, Principal principal, @Nullable State searchType) {
		String writer = principal.getName();
		return new ModelAndView("main").addObject("viewName", "user/questionList.jsp").addObject("questionPage", service.questionList(pageno, writer, searchType));
	}
	
	@GetMapping("/artist/questionList")
	public ModelAndView artistQuestionList(@RequestParam(defaultValue = "1")int pageno, Principal principal, @Nullable State searchType) {
		String writer = principal.getName();
		return new ModelAndView("main").addObject("viewName", "artist/questionList.jsp").addObject("questionPage", service.questionList(pageno, writer, searchType));
	}
	
	@PostAuthorize("isAuthenticated() or hasRole('ROLE_ADMIN')")
	@GetMapping("/admin/question_read")
	public ModelAndView qusetionRead(@RequestParam(value = "qno")@NonNull Integer qno) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("main").addObject("viewName", "admin/question/read.jsp");
		AdminBoardDto.DtoForQuestionRead dto = service.questionRead(qno);
		String json = objectMapper.writeValueAsString(dto); 
		mav.addObject("question", json);
		return mav;
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/admin/question_answer")
	public String questionAnswer(Question question, Principal principal) {
		String answer = principal.getName();
		question.setAnswer(answer);
		service.questionAnswer(question);
		return "redirect:/admin/question_read?qno="+question.getQno();
	}

	@GetMapping("/user/noticeList")
	public ModelAndView userNoticeList(@RequestParam(defaultValue = "1")int pageno, @Nullable Boolean isImportant) {
		return new ModelAndView("main").addObject("viewName","user/noticeList.jsp").addObject("noticePage", service.noticeList(pageno, isImportant));
	}
	
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/notice_list")
	public ModelAndView noticeList(@RequestParam(defaultValue = "1")int pageno, @Nullable Boolean isImportant) {
		return new ModelAndView("admin/notice/list").addObject("noticePage", service.noticeList(pageno, isImportant));
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/notice_write")
	public ModelAndView noticeWrite() {
		return new ModelAndView("admin/notice/write");
	}
	
	@GetMapping("/admin/notice_read")
	public ModelAndView noticeRead(@NonNull Integer noticeno) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("main").addObject("viewName", "admin/notice/read.jsp");		
		AdminBoardDto.DtoForNoticeRead dto = service.noticeRead(noticeno);
		String json = objectMapper.writeValueAsString(dto);
		mav.addObject("notice", json);
		return mav;
	}

	@Secured("ROLE_ADMIN")
	@PostMapping("/admin/notice_write")
	public String write(AdminBoardDto.DtoForNoticeWrite dto) {
		dto.setWriter("관리자");
		try {
			return "redirect:/admin/notice_read?noticeno="+service.write(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/admin/notice_update")
	public String noticeUpdate(Notice notice) {
		service.noticeUpdate(notice);
		return "redirect:/admin/notice_read?noticeno="+notice.getNoticeno();
	}


	@GetMapping("/user/faqList")
	public ModelAndView faqList() {
		return new ModelAndView("admin/faq/list").addObject("faqList", service.faqList());
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/faq_write")
	public ModelAndView faqWrite() {
		return new ModelAndView("admin/faq/write");
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/admin/faq_write")
	public String faqWrite(FAQ faq) {
		service.faqWrite(faq);
		return "redirect:/user/faqList";
	}

	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/category_list")
	public ModelAndView categoryList() {
		return new ModelAndView("admin/category/list").addObject("categoryList", service.categoryList());
	}
}
