package com.icia.adaco.controller.rest;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.entity.*;
import com.icia.adaco.service.rest.*;

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
	
	@PostMapping("/admin/notice/ckupload")
	public ResponseEntity<?> ckUpload(MultipartFile upload) {
		return ResponseEntity.ok(service.saveCkImage(upload));
	}

}
