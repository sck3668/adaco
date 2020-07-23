package com.icia.adaco.controller.rest;

import java.security.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.*;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.adaco.service.rest.AdminUserRestService;

import lombok.*;

@RestController
public class AdminUserRestController {
	@Autowired
	AdminUserRestService service;
	
	@Secured("ROLE_ADMIN")
	@PutMapping("/admin/user_update")
	public ResponseEntity<Void> update(String username, @Nullable String authority, @Nullable Boolean enabled, Principal principal) {
		String sender = principal.getName();
		service.update(username, authority, enabled, sender);
		return ResponseEntity.ok(null);
	}

}
