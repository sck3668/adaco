package com.icia.adaco.controller.rest;

import java.io.*;
import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
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
	//@PreAuthorize("isAuthenticated()")
	@PutMapping("/story/commentWrite")
	public ResponseEntity<?>ListComment(@RequestParam(defaultValue = "1")int pageno,StoryComment storyComment,Principal principal){
		System.out.println(storyComment+"==========");
		System.out.println(principal.getName()+"ㅎㅎㅎㅎ");
		System.out.println("commentList==============="+restService.ListComment(pageno,storyComment, principal.getName()));
	return ResponseEntity.ok(restService.ListComment(pageno,storyComment, principal.getName()));
	}
	
	
	
	
}
