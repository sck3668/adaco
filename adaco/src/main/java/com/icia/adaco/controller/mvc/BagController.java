package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;
import java.util.*;


import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.core.type.*;
import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class BagController {
	@Autowired
	private BagService bagService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();
	
	// 장바구니  추가--------------------------
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/bag/add")
	public ResponseEntity<?> insert(Bag bag,Principal principal) {
		return ResponseEntity.ok(bagService.insertByBag(bag,principal.getName()));
	}
		
	//장바구니 화면 출력
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/bag/view")
	public ModelAndView view() {
		return new ModelAndView("main").addObject("viewName","bag/read.jsp");
	}
		
	// 장바구니 목록 출력
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/bag/list2")
	public ResponseEntity<?> read(Principal principal) {
		return ResponseEntity.ok(bagService.findAllBagByUsername(principal.getName()));
	}
	
	// 장바구니 재고 체크
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/bag/checkStock")
	public ResponseEntity<?> checkStock(int artno,Principal principal) {
		return ResponseEntity.ok(bagService.checkStock(artno,principal.getName()));
	}
	
	// 장바구니 수량 변경
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/bag/change")
	public ResponseEntity<?> change(int artno,boolean isIncrese,Principal principal) {
		Bag bag = bagService.change(artno,isIncrese,principal.getName());
		return ResponseEntity.ok(bag);
	}
	
	// 장바구니 선택 삭제
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/bag/choiseDelete")
	public ResponseEntity<?> delete(String artnos,Principal principal) throws JsonParseException, JsonMappingException, IOException {
		List<Integer> list = objectMapper.readValue(artnos, new TypeReference<List<Integer>>() {});
		List<BagDto.DtoForList> bagList = bagService.deleteByBag(list,principal.getName());
		return ResponseEntity.ok(bagList);
	}
	
	//선택한 작품 구매
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/bag/ordering")
	public ResponseEntity<?> Ordering(String artnos,Principal principal) throws JsonParseException, JsonMappingException, IOException {
		List<Integer> list = objectMapper.readValue(artnos, new TypeReference<List<Integer>>() {});
		if(principal==null) {
			throw new JobFailException("로그인 필요합니다");
		}
		return ResponseEntity.ok(orderService.bagOrdering(list,principal.getName()));
	}
}