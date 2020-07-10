package com.icia.adaco.controller.rest;

import java.io.*;
import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.service.rest.*;

@RestController
public class ShopRestController {
	@Autowired
	private ShopRestService shopRestService;
	@Autowired
	private ArtistDao artistDao;
	
	@PutMapping("/artist/updateByShop")
	public ResponseEntity<?> updateShop(ShopDto.DtoForUpdate updateDto,  MultipartFile sajin , Principal principal) throws IllegalStateException, IOException {
//		int artistno =	artistDao.findArtistnoByUsername(principal.getName());
		System.out.println(updateDto+"ggggggggggg");
		shopRestService.updateByShop(principal.getName(), sajin, updateDto);
		return ResponseEntity.ok(null);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PutMapping("/artist/update")
	public ResponseEntity<Void> update(ShopDto.DtoForUpdate updateDto,  MultipartFile sajin , Principal principal) throws IllegalStateException, IOException {
		shopRestService.update(principal.getName(), sajin, updateDto);
		return ResponseEntity.ok(null);
		}
	}


