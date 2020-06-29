package com.icia.adaco.controller.rest;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.web.bind.annotation.*;

import com.icia.adaco.dto.*;
import com.icia.adaco.service.rest.*;

@RestController
public class StoryBoardRestController {
	@Autowired
	private StoryRestService restService;

	@PreAuthorize("isAuthenticated()")
	@PatchMapping("/story/update")
	public ResponseEntity<?> updateStory(Principal principal, StoryBoardDto.DtoforUpdate updateDto) {
		updateDto.setWriter(principal.getName());
		restService.updateStory(updateDto, principal);
		return ResponseEntity.ok(null);
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/story/delete")
	public ResponseEntity<?> deleteStory(Principal principal,Integer storyno){
		restService.deleteStory(principal, storyno);
		return ResponseEntity.ok("/adaco/story/list");
	}
}
