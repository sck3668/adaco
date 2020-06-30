package com.icia.adaco.controller.mvc;

import java.security.*;
import java.util.*;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.math.*;
import org.springframework.beans.factory.annotation.*;
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
		return new ModelAndView("admin/question/list").addObject("questionPage", service.questionList(pageno, writer, searchType));
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

	
	@GetMapping("/user/faq_list")
	public ModelAndView faqList() {
		return new ModelAndView("main").addObject(service.faqList());
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
