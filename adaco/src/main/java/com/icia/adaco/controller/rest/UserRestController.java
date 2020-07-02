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
import com.icia.adaco.service.rest.*;

@RestController
public class UserRestController {
	@Autowired
	private UserRestService userRestService;

	@GetMapping("/user/check_id")
	public ResponseEntity<Boolean> checkId(@RequestParam String username) {
		System.out.println("restControlerr==================");
		return ResponseEntity.ok(userRestService.checkId(username));
	}

	@GetMapping("/user/check_email")
	public ResponseEntity<Boolean> checkEmail(@RequestParam @NotNull String email) {
		return ResponseEntity.ok(userRestService.checkEmail(email));
	}

	@PreAuthorize("isAuthenticated()")
	@PutMapping("/user/update")
	public ResponseEntity<?> update(@Valid UserDto.DtoForUpdate dto, BindingResult results, MultipartFile sajin, Principal principal) throws BindException {
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
	@GetMapping("/user/profile")
	public ResponseEntity<?> profile(Principal principal) {
		userRestService.findProfile(principal.getName());
		return ResponseEntity.ok(userRestService.findProfile(principal.getName()));
	}
//	@PostMapping("/user/findId2")
//	public ResponseEntity<?> checkId2(@RequestParam String Irum) {
//		System.out.println("===========");
//		System.out.println(Irum);
//		return ResponseEntity.ok(null);
//	}
//	
}
