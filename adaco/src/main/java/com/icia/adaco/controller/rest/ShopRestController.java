package com.icia.adaco.controller.rest;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
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
	
	public ResponseEntity<?> updateShop(ShopDto.DtoForUpdate updateDto,  MultipartFile sajin , Principal principal) {
//		int artistno =	artistDao.findArtistnoByUsername(principal.getName());
		shopRestService.updateByShop(principal.getName(), sajin, updateDto);
		return ResponseEntity.ok(null);
	}
}
