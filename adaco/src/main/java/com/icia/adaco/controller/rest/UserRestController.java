package com.icia.adaco.controller.rest;

import java.io.*;
import java.security.*;

import javax.validation.constraints.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
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

	@GetMapping("/user/check_id")
	public ResponseEntity<Boolean> checkId(@RequestParam String username) {
		return ResponseEntity.ok(userRestService.checkId(username));
	}

	@GetMapping("/user/check_email")
	public ResponseEntity<Boolean> checkEmail(@RequestParam @NotNull String email) {
		return ResponseEntity.ok(userRestService.checkEmail(email));
	}
	
	//@PreAuthorize("isAuthenticated()")
	@PutMapping("/user/update")
	public ResponseEntity<Void> update(UserDto.DtoForUpdate dto, BindingResult results, MultipartFile sajin, Principal principal) throws BindException {
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
	@PutMapping("/user/favoriteDelete")
	public ResponseEntity<?> delete(int favno){
		System.out.println(favno);
		userRestService.delete(favno);
		return ResponseEntity.ok(null);
	}
//	@PostMapping("/user/findId2")
//	public ResponseEntity<?> checkId2(@RequestParam String Irum) {
//		System.out.println("===========");
//		System.out.println(Irum);
//		return ResponseEntity.ok(null);
//	}
//	
}
