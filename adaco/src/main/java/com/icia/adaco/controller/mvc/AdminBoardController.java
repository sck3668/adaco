package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;
import java.util.*;

import javax.servlet.http.*;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.math.*;
import org.springframework.beans.factory.annotation.*;
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

//@PreAuthorize("isAuthenticated()")
//@Secured("ROLE_ADMIN")
@Controller
public class AdminBoardController {
	
	@Autowired
	AdminBoardService service;
	@Autowired
	ObjectMapper objectMapper;
	
	
	@GetMapping("/admin/")
	public ModelAndView adminIndex() {
		return new ModelAndView("admin/index").addObject("index", service.indexRead());
	}
	
//	@PreAuthorize("isAuthenticated()")
//	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/report_list")
	public ModelAndView reportList(@RequestParam(defaultValue = "1")int pageno) {
		return new ModelAndView("admin/report/list").addObject("reportPage", service.reportList(pageno));
	}
	
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
	
//	@Secured("ROLE_ADMIN")
//	@PreAuthorize("isAuthenticated()")
	@GetMapping("/admin/question_list")
	public ModelAndView questionList(@RequestParam(defaultValue = "1")int pageno, @Nullable String writer, @Nullable State searchType) {
		return new ModelAndView("admin/question/list"
				+ "").addObject("questionPage", service.questionList(pageno, writer, searchType));
	}
	
//	@Secured("ROLE_ADMIN")
//	@PreAuthorize("isAuthenticated()")
	@GetMapping("/admin/question_read")
	public ModelAndView qusetionRead(@RequestParam(value = "qno")@NonNull Integer qno) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("admin/question/read");
		AdminBoardDto.DtoForQuestionRead dto = service.questionRead(qno);
		String json = objectMapper.writeValueAsString(dto); 
		mav.addObject("question", json);
		return mav;
	}
	
//	@PreAuthorize("isAuthenticated()")
//	@Secured("ROLE_ADMIN")
	@PostMapping("/admin/question_answer")
	public String questionAnswer(Question question, Principal principal) {
		service.questionAnswer(question);
		return "redirect:/admin/question_read?qno="+question.getQno();
	}
	
	@GetMapping("/admin/notice_list")
	public ModelAndView noticeList(@RequestParam(defaultValue = "1")int pageno, @Nullable Boolean isImportant) {
		return new ModelAndView("admin/notice/list").addObject("noticePage", service.noticeList(pageno, isImportant));
	}
	
	@GetMapping("/admin/notice_write")
	public ModelAndView noticeWrite() {
		return new ModelAndView("admin/notice/write");
	}
	
	@GetMapping("/admin/notice_read")
	public ModelAndView noticeRead(@NonNull Integer noticeno) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("admin/notice/read");		
		AdminBoardDto.DtoForNoticeRead dto = service.noticeRead(noticeno);
		String json = objectMapper.writeValueAsString(dto);
		mav.addObject("notice", json);
		return mav;
		
	}
	
	@PostMapping("/admin/notice_write")
	public String write(AdminBoardDto.DtoForNoticeWrite dto) {
		dto.setWriter("관리자");
		try {
			return "redirect:/admin/notice_read?noticeno="+service.write(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}
//		for(MultipartFile f:dto.getAttachments())
//			System.out.println("파일이름"+f.getOriginalFilename());
		return "redirect:/";
	}
	
//	@PreAuthorize("isAuthenticated()")
//	@Secured("ROLE_ADMIN")
	@PostMapping("/admin/notice_update")
	public String noticeUpdate(Notice notice) {
		service.noticeUpdate(notice);
		return "redirect:/admin/notice_read?qno="+notice.getNoticeno();
	}

	
	@GetMapping("/user/faq_list")
	public ModelAndView faqList() {
		return new ModelAndView("admin/faq/list").addObject("faqList", service.faqList());
	}
	
//	@PreAuthorize("isAuthenticated()")
//	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/faq_write")
	public ModelAndView faqWrite() {
		return new ModelAndView("main");
	}
	
	@PostMapping("/admin/faq_write")
	public String faqWrite(FAQ faq) {
		return "redirect:/admin/faq_read?faqno="+service.faqWrite(faq);
	}
	

}
