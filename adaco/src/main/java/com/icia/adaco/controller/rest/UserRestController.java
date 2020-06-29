package com.icia.adaco.controller.rest;

import javax.validation.constraints.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.adaco.exception.*;
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
	
}
