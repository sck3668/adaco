package com.icia.adaco.controller.rest;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.adaco.service.rest.*;

@RestController
public class AdminBoardRestController {
	@Autowired
	AdminBoardRestService service;
	
	public ResponseEntity<?> delete(Integer artno) {
		service.deleteArt(artno);
		return ResponseEntity.ok("/adaco/admin/");
	}
}
