package com.icia.adaco.controller.rest;

import java.security.*;

import javax.validation.constraints.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;

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
	public ResponseEntity<Void> updateArt(ArtDto.DtoForUpdate dto, BindingResult results, Principal principal ) throws BindException{
		if(results.hasErrors())
			throw new BindException(results);
		dto.setUsername(principal.getName());
		service.updateArt(dto);
		return ResponseEntity.ok(null);
		
	}

	/*@PostMapping("/art/read")
	public ResponseEntity<?>read(@RequestParam @NotNull Integer artno, Principal principal) throws JsonProcessingException {
		String username = prn
	}*/
}
