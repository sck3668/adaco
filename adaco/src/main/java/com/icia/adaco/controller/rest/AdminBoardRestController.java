package com.icia.adaco.controller.rest;

import java.io.*;
import java.security.*;

import org.apache.commons.io.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.entity.*;
import com.icia.adaco.service.rest.*;

@RestController
public class AdminBoardRestController {
	@Autowired
	AdminBoardRestService service;
	
	@GetMapping("/attachment/view")
	public ResponseEntity<?> view(Integer ano) throws IOException {
//		response header에 Content-Disposition 값을 inline을 주면 보기. attachment를 주면 다운로드
		Attachment a = service.readAttachment(ano);
		String originalFileName = a.getOriginalFileName();
//		new File()은 파일이 있으면 열고 없으면 새로 만든다.
		File saveFile = new File("d:/upload/attachment", a.getSaveFileName());
		HttpHeaders headers = new HttpHeaders();
		if(a.isImage()==true) {
//			contentType 지정 : image/jpeg, image/png
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1).toUpperCase();
			if(ext.equals("JPG") || ext.equals("JPEG"))
				headers.setContentType(MediaType.IMAGE_JPEG);
			else if(ext.equals("PNG"))
				headers.setContentType(MediaType.IMAGE_PNG);
			else if(ext.equals("GIF"))
				headers.setContentType(MediaType.IMAGE_GIF);
			headers.add("Content-Disposition", "inline;filename="+originalFileName);
		} else {
//			contentType을 octet_stream 으로 지정
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment;filename=" + originalFileName);
		}
//		텍스트 입출력 클래스 : Reader, Writer
//		이진 데이터 입출력 클랙스 : InputStream, OutputStream
		InputStream in = new FileInputStream(saveFile);
		byte[] attachmentFile = IOUtils.toByteArray(in);
		in.close();
		return ResponseEntity.ok().headers(headers).body(attachmentFile);
	}

	@Secured("ROLE_ADMIN")
	@DeleteMapping("/attachment/delete")
	public ResponseEntity<?> deleteAttachment(Integer ano, Integer noticeno) {
		return ResponseEntity.ok(service.deleteAttachment(ano, noticeno));
	}
		
	@Secured("ROLE_ADMIN")
	@DeleteMapping("/admin/delete_art")
	public ResponseEntity<?> artDelete(Integer artno) {
		service.deleteArt(artno);
		return ResponseEntity.ok("/adaco/admin/");
	}
	
	@Secured("ROLE_ADMIN")
	@DeleteMapping("/admin/notice_delete")
	public ResponseEntity<?> noticeDelete(Integer noticeno) {
		service.deleteNoitce(noticeno);
		return ResponseEntity.ok("/adaco/admin/notice_list");
	}

	@Secured("ROLE_ADMIN")
	@PatchMapping("/admin/faq_update")
	public ResponseEntity<?> faqUpdate(FAQ faq) {
		return ResponseEntity.ok(service.updateFaq(faq));
	}
	
	@Secured("ROLE_ADMIN")
	@DeleteMapping("/admin/faq_delete")
	public ResponseEntity<?> faqDelete(Integer faqno) {
		return ResponseEntity.ok(service.deleteFaq(faqno));
	}

	@Secured("ROLE_ADMIN")
	@PostMapping("/admin/notice/ckupload")
	public ResponseEntity<?> ckUpload(MultipartFile upload) {
		return ResponseEntity.ok(service.saveCkImage(upload));
	}
	
	@Secured("ROLE_ADMIN")
	@DeleteMapping("/admin/category_delete")
	public ResponseEntity<?> categoryDelete(String category) {
		service.deleteCategory(category);
		return null;
	}

	@Secured("ROLE_ADMIN")
	@PostMapping("/admin/category_write")
	public ResponseEntity<?> categoryWrite(Category category) {
		service.writeCategory(category);
		return null;
	}
}
