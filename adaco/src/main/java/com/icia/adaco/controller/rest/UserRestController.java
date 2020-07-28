package com.icia.adaco.controller.rest;

import java.io.*;
import java.security.*;

import javax.validation.*;
import javax.validation.constraints.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.rest.*;

@RestController
public class UserRestController {
	@Autowired
	private UserRestService userRestService;
	
	//유저네임 확인
	@GetMapping("/user/check_id")
	public ResponseEntity<Boolean> checkId(@RequestParam String username) {
		return ResponseEntity.ok(userRestService.checkId(username));
	}
	
	//이메일 확인
	@GetMapping("/user/check_email")
	public ResponseEntity<Boolean> checkEmail(@RequestParam @NotNull String email) {
		return ResponseEntity.ok(userRestService.checkEmail(email));
	}
	
	//내정보화면 업데이트
	@PreAuthorize("isAuthenticated()")
	@PutMapping("/user/update")
	public ResponseEntity<Void> update(@Valid UserDto.DtoForUpdate dto, BindingResult results, MultipartFile sajin, Principal principal) throws BindException {
		if(results.hasErrors())
			throw new BindException(results);
		dto.setUsername(principal.getName());
		try {
			userRestService.update(dto, sajin);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return ResponseEntity.ok(null);
	}
	
	//유저 즐찾삭제
	@DeleteMapping("/user/favoriteDelete")
	public ResponseEntity<?> favoriteDelete(int favno){
		userRestService.favoriteDelete(favno);
		return ResponseEntity.ok(userRestService.favoriteDelete(favno));
	}
	
	//리뷰 삭제
	@PutMapping("/user/reviewDelete")
	public ResponseEntity<?>reviewDelete(int rno){
		userRestService.reviewDelete(rno);
		return ResponseEntity.ok(null);
	}

	//즐겨찾기 업데이트
	@PostMapping("/user/favoriteUpdate")
	public ResponseEntity<?> add(Principal principal,int artno) {
		return ResponseEntity.ok(userRestService.favoriteUpdate(principal.getName(), artno));
	}
	
//	//유저 회원탈퇴
//	@PutMapping("/user/delete")
//	public ResponseEntity<?> delete(Principal principal) {
//		userRestService.userDelete(principal.getName());
//		return ResponseEntity.ok(null);
//	}
	
	//프로필 사진
	@GetMapping("/user/profile")
	public ResponseEntity<String> findProfile(String username) {
		return ResponseEntity.ok(userRestService.findProfile(username));
	}
	
	//댓글 신고기능
	@PatchMapping("/user/commentReport")
	public ResponseEntity<?> Report(int artno,Principal principal,int cno){
		return ResponseEntity.ok(userRestService.commentReport(artno, principal.getName(), cno));
	}
	
}
