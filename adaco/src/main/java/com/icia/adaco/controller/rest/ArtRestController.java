package com.icia.adaco.controller.rest;

import java.security.*;

import javax.validation.constraints.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.fasterxml.jackson.core.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.service.rest.*;

@RestController
public class ArtRestController {
	@Autowired
	private ArtRestService service;
	
	// 작품 업데이트(수정)
	//@PreAuthorize("isAuthenticated()")
	@PatchMapping("/art/update")
	public ResponseEntity<Void> updateArt(ArtDto.DtoForUpdate dto, BindingResult results, Principal principal, MultipartFile artSajin ) throws BindException{
		if(results.hasErrors())
			throw new BindException(results);
		dto.setUsername(principal.getName());
		service.updateArt(dto,artSajin);
		return ResponseEntity.ok(null);
		
	}
	// 작품 상세보기 (작가용)
	@PostMapping("/art/read")
	public ResponseEntity<?>readArt(@RequestParam @NotNull Integer artno, Principal principal, Integer optno) throws JsonProcessingException {
		String username = principal!=null? principal.getName():null;
		ArtDto.DtoForRead dto = service.readArt(artno, optno,username);
		return ResponseEntity.ok(dto);
	}
	
	// 작품 상세보기 (회원용)
	@PostMapping("/art/readbyuser")
	public ResponseEntity<?>readArtFromUser(@RequestParam @NotNull Integer artno, Principal principal, Integer optno) throws JsonProcessingException {
		String username = principal!=null? principal.getName():null;
		ArtDto.DtoForRead dto = service.readArtFromUser(artno, optno,username);
		return ResponseEntity.ok(dto);
	}
	
	// 작품 이미지 찾기
	@GetMapping("/art/artfile")
	public ResponseEntity<String> findArtfile(Integer artno){
		return ResponseEntity.ok(service.findArtfile(artno));
	}
	
	// 작품 삭제
	//@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/art/delete")
	public ResponseEntity<?> deleteArt(Integer artno, Principal principal, Integer artistno, Integer optno){
		service.deleteArt(artno, principal.getName(), artistno, optno);
		return ResponseEntity.ok("/adaco/art/list");
	}
}
