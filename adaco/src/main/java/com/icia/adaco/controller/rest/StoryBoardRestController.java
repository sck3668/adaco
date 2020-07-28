package com.icia.adaco.controller.rest;

import java.io.*;
import java.security.*;

import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.rest.*;

@RestController
public class StoryBoardRestController {
	@Autowired
	private StoryRestService restService;
	
	// 스토리 수정
	@PreAuthorize("isAuthenticated()")
	@PatchMapping("/story/update")
	public ResponseEntity<?> updateStory(Principal principal, StoryBoardDto.DtoforUpdate updateDto) {
		updateDto.setWriter(principal.getName());
		restService.updateStory(updateDto, principal);
		return ResponseEntity.ok(null);
	}
	
	// 스토리 삭제
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/story/delete")
	public ResponseEntity<?> deleteStory(Principal principal,Integer storyno){
		restService.deleteStory(principal, storyno);
		return ResponseEntity.ok("/adaco/story/listStory");
	}
	
	// 스토리 ckupload
	@PostMapping("/story/ckupload")
	public ResponseEntity<?> ckupload(MultipartFile upload) throws IOException{
		return ResponseEntity.ok(restService.ckupload(upload));
	}
	
	//스토리 댓글 입력/출력
	@PostMapping("/comment/write")
	public ResponseEntity<?> writeComment(StoryComment storyComment, Principal principal) {
		RestTemplate tpl = new RestTemplate();
		String url = "http://localhost:8081/adaco/user/profile?username="+principal.getName();
		ResponseEntity<String> result = tpl.getForEntity(url, String.class);
		String profile = result.getBody();
		storyComment.setProfile(profile);
		storyComment.setWriter(principal.getName());
		return ResponseEntity.ok(restService.commentWrite(storyComment,principal.getName()));	
	}
	
	//댓글 삭제
	@DeleteMapping("/story/commentDelete")
	public ResponseEntity<?> deleteComment(Integer cno, Integer storyno, String writer) {
		return ResponseEntity.ok(restService.deleteComment(storyno, cno, writer));
	}
}
