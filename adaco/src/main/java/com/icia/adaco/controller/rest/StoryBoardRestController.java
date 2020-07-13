package com.icia.adaco.controller.rest;

import java.io.*;
import java.security.*;

import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
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
	
 
	//@PreAuthorize("isAuthenticated()")
	@PatchMapping("/story/update")
	public ResponseEntity<?> updateStory(Principal principal, StoryBoardDto.DtoforUpdate updateDto) {
		updateDto.setWriter(principal.getName());
		restService.updateStory(updateDto, principal);
		return ResponseEntity.ok(null);
	}
	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/story/delete")
	public ResponseEntity<?> deleteStory(Principal principal,Integer storyno){
		restService.deleteStory(principal, storyno);
		return ResponseEntity.ok("/adaco/story/list");
	}
	@PostMapping("/story/ckupload")
	public ResponseEntity<?> ckupload(MultipartFile upload) throws IOException{
		restService.ckupload(upload);
		return ResponseEntity.ok(restService.ckupload(upload));
	}
	//
	//@PostMapping("/story/commentWrtie")
	public ResponseEntity<?> commentWrite(@RequestParam(defaultValue="1") int pageno,StoryComment storyComment,Principal principal) {
		storyComment.setWriter(principal.getName());
		System.out.println("storyRestcontroller storyComment===="+storyComment);
		System.out.println(principal.getName()+"principal");
		return ResponseEntity.ok(restService.commentWrtie(pageno, storyComment,principal.getName()));
	}
	
	//스토리 댓글 입력/출력
	@PostMapping("/comment/write")
	public ResponseEntity<?> writeComment(StoryComment storyComment, Principal principal) {
		System.out.println("유저네임" + principal.getName());
		storyComment.setWriter(principal.getName());
		System.out.println("스토리스토리스토리스토리"+storyComment);
		return ResponseEntity.ok(restService.commentWrite(storyComment,principal.getName()));	
	}
	
	
	//@PreAuthorize("isAuthenticated()")
	//@PutMapping("/story/commentWrite")
	public ResponseEntity<?>ListComment(@RequestParam(defaultValue = "1")int pageno,StoryComment storyComment,Principal principal){
		System.out.println(storyComment+"==========");
		System.out.println(principal.getName()+"ㅎㅎㅎㅎ");
		//System.out.println("commentList==============="+restService.ListComment(pageno,storyComment, principal.getName()));
	return ResponseEntity.ok(restService.readComment(storyComment.getStoryno(), principal.getName()));
	}
	
	
	//댓글 삭제
	@DeleteMapping("/story/commentDelete")
	public ResponseEntity<?> deleteComment(Integer cno, Integer storyno, String writer) {
		System.out.println("commentDelete controller=============");
		return ResponseEntity.ok(restService.deleteComment(storyno, cno, writer));
	}
}
