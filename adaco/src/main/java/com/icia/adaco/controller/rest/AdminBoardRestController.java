package com.icia.adaco.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.adaco.entity.FAQ;
import com.icia.adaco.service.rest.AdminBoardRestService;

@RestController
public class AdminBoardRestController {
	@Autowired
	AdminBoardRestService service;
	
//	@PreAuthorize("isAuthenticated()")
//	@Secured("ROLE_ADMIN")
	@DeleteMapping("/admin/delete_art")
	public ResponseEntity<?> artDelete(Integer artno) {
		service.deleteArt(artno);
		return ResponseEntity.ok("/adaco/admin/");
	}
	
	
//	@PreAuthorize("isAuthenticated()")
//	@Secured("ROLE_ADMIN")
	@DeleteMapping("/admin/notice_delete")
	public ResponseEntity<?> noticeDelete(Integer noticeno) {
		service.deleteNoitce(noticeno);
		return ResponseEntity.ok("/adaco/admin");
	}
	
	@PatchMapping("/admin/faq_update")
	public ResponseEntity<?> faqUpdate(FAQ faq) {
		return ResponseEntity.ok(service.updateFaq(faq));
	}
	
//	@PreAuthorize("isAuthenticated()")
//	@Secured("ROLE_ADMIN")
	@DeleteMapping("/admin/faq_delete")
	public ResponseEntity<?> faqDelete(Integer faqno) {
		return ResponseEntity.ok(service.deleteFaq(faqno));
	}
}
