package com.icia.adaco.controller.rest;

import java.io.*;
import java.security.*;
import java.util.*;

import javax.servlet.http.*;
import javax.validation.*;
import javax.validation.constraints.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.lang.*;
import org.springframework.security.access.prepost.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.*;
import org.springframework.web.multipart.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.core.type.*;
import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.rest.*;

@RestController
public class ArtRestController {
	@Autowired
	private ArtRestService service;
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();
	
	// 작품 업데이트(수정)
	@PreAuthorize("isAuthenticated()")
	@PutMapping("/art/update")
	public ResponseEntity<Void> updateArt(ArtDto.DtoForUpdate dto, BindingResult results, Principal principal, MultipartFile artSajin ) throws BindException, IllegalStateException, IOException{
		if(results.hasErrors())
			throw new BindException(results);
		dto.setUsername(principal.getName());
		service.updateArt(dto,artSajin);
		return ResponseEntity.ok(null);
	}
	
	// 작품 상세보기 (작가용)
	@PostMapping("/art/read2")
	public ResponseEntity<?>readArt(@RequestParam @NotNull Integer artno, Principal principal) throws JsonProcessingException {
		String username = principal!=null? principal.getName():null;
		ArtDto.DtoForRead dto = service.readArt(artno, username);
		return ResponseEntity.ok(dto);
	}
	
	// 작품 상세보기 (회원용)
	@PostMapping("/art/read")
	public ResponseEntity<?>readArtFromUser(@RequestParam @NotNull Integer artno, Principal principal) throws JsonProcessingException {
		String username = principal!=null? principal.getName():null;
		ArtDto.DtoForRead dto = service.readArtFromUser(artno, username);
		return ResponseEntity.ok(dto);
	}
	
	// 작품 이미지 찾기
	@GetMapping("/art/artfile")
	public ResponseEntity<String> findArtfile(Integer artno){
		return ResponseEntity.ok(service.findArtfile(artno));
	}
	
	// 작품 삭제
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/art/delete")
	public ResponseEntity<?> deleteArt(Integer artno, Principal principal){
		service.deleteArt(artno, principal.getName());
		return ResponseEntity.ok("/adaco/art/list");
	}
	
	//작품 선택 삭제   -------------
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/art/deleteChoice")
	public ResponseEntity<?> deleteArt(String artnos, int pageno, Principal principal, @Nullable String category) throws JsonParseException, JsonMappingException, IOException {
		List<Integer> list = objectMapper.readValue(artnos,new TypeReference<List<Integer>>() {});
		List<ArtDto.DtoForList> artList = service.deleteArt(list,pageno, principal.getName(), category);
		return ResponseEntity.ok(artList);
	}
	
	// 작품 댓글 작성
	//@PreAuthorize("isAuthenticated()")
	@PutMapping("/artcomment/write")
	public ResponseEntity<?> writeArtComment(@Valid ArtComment artcomment, BindingResult bindingResult, Principal principal) {
		RestTemplate tpl = new RestTemplate();
		String url = "http://localhost:8081/adaco/user/profile?username=" + principal.getName();
		System.out.println("4");
		ResponseEntity<String> result = tpl.getForEntity(url, String.class);
		String profile = result.getBody();
		artcomment.setProfile(profile);
		artcomment.setUsername(principal.getName());
		return ResponseEntity.ok(service.writeCommentOfArt(artcomment));	
	}
	//리뷰작성
	@PutMapping("/artReview/review")
	public ResponseEntity<?>writeArtReview(Review review, @Nullable MultipartFile sajin,Integer artno,Principal principal) throws IllegalStateException, IOException{
		return ResponseEntity.ok(service.writeReviewOfArt(review,sajin,artno,principal.getName()));
	}
	//리뷰삭제
	@DeleteMapping("/artReview/reviewDelete")
	public ResponseEntity<?> deleteArtReview(Integer artno,Principal principal,Integer rno){
		return ResponseEntity.ok(service.deleteReviewOfArt(rno,artno,principal.getName()));
	}
	
	// 작품 댓글 삭제
	//@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/artcomment/delete")
	public ResponseEntity<?> deleteArtComment(Integer cno, Integer artno, Principal principal){
		return ResponseEntity.ok(service.deleteCommentOfArt(cno, artno, principal.getName()));
	}
	
}