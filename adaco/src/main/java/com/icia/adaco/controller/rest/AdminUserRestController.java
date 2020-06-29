package com.icia.adaco.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.adaco.service.rest.AdminUserRestService;

@RestController
public class AdminUserRestController {

	@Autowired
	AdminUserRestService service;
	
//	@PreAuthorize("isAuthenticated()")
//	@Secured("ROLE_ADMIN")
	@PutMapping("/admin/user_update")
	public ResponseEntity<Void> update(String username, String authority, boolean enabled) {
		service.update(username, authority, enabled);
		return ResponseEntity.ok(null);
	}	
}
