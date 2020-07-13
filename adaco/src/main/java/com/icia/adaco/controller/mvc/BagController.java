package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;
import java.util.*;

import javax.servlet.http.*;

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
import com.icia.adaco.dto.BagDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;
import com.sun.mail.iap.*;

@Controller
public class BagController {
	@Autowired
	private BagService bagService;
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();
	
	// 장바구니  추가--------------------------
		@PostMapping("/bag/add")
		public ResponseEntity<?> insert(Bag bag,Principal principal) {
			System.out.println("bag============"+bag);
			System.out.println("controller=================");
			return ResponseEntity.ok(bagService.inse	rtByBag(bag));
		}
		
		@GetMapping("/bag/list")
		public ModelAndView findAllBagByUsername(String username) {
			return new ModelAndView("main").addObject("viewName", "bag/read.jsp").addObject("bagList",bagService.findAllBagByUsername(username));
		}
		
		@GetMapping("/bag/view")
		public ModelAndView view() {
			return new ModelAndView("main").addObject("viewName","bag/read.jsp");
		}
		
		@GetMapping("/bag/list1")
		public ModelAndView findAllBagByUsername1(Principal principal) {
			return new ModelAndView("main").addObject("viewName", "bag/read.jsp").addObject("bagList",bagService.findAllBagByUsername(principal.getName()));
		}
		 
		@GetMapping("/bag/list2")
		public ResponseEntity<?> read(Principal principal) {
			return ResponseEntity.ok(bagService.findAllBagByUsername(principal.getName()));
		}
		
		@GetMapping("/bag/checkStock")
		public ResponseEntity<?> checkStock(int artno) {
			return ResponseEntity.ok(bagService.checkStock(artno));
		}
		
		@PostMapping("/bag/change")
		public ResponseEntity<?> change(int artno,boolean isIncrese) {
			Bag bag = bagService.change(artno,isIncrese);
			return ResponseEntity.ok(bag);
		}
		
		@DeleteMapping("/bag/choiseDelete")
		public ResponseEntity<?> delete(String artnos,Principal principal) throws JsonParseException, JsonMappingException, IOException {
			System.out.println("deleteController artno======="+artnos);
			List<Integer> list = objectMapper.readValue(artnos, new TypeReference<List<Integer>>() {});
			List<BagDto.DtoForList> bagList = bagService.deleteByBag(list,principal.getName());
			return ResponseEntity.ok(bagList);
		}
//////////////////////////////////////////////
	/*
	 * @GetMapping("/user/bag") public ModelAndView bagRead() { return new
	 * ModelAndView("main").addObject("viewName", "bag/read.jsp"); }
	 */
	
	/*
	 * @GetMapping("/bag/list1") public ModelAndView list1(@Nullable int artno) {
	 * return new
	 * ModelAndView("main").addObject("viewName","bag/read.jsp").addObject("list1",
	 * bagService.findAllByBag(artno)); }
	 */
	
//	  @GetMapping("/bag/list") 
//	  public ModelAndView list2() { 
//		  return new ModelAndView("main").addObject("viewName","bag/read.jsp"); 
//		  }
	 
	
			/*
			 * @GetMapping("/bag/read") public ResponseEntity<?> list(String username) {
			 * System.out.println("bag/list  list1출력"); List<Bag> bagList =
			 * bagService.findAllBagByUsername(username); return ResponseEntity.ok(bagList);
			 * }
			 */
	
	
//	@PostMapping("/bag/delete")
	//public ResponseEntity<?> delete(HttpSession session, int artno) {
		//List<Bag> bagList = bagService.deleteByBag(artno);
		//System.out.println(bagList+"controller CartList");
		//return ResponseEntity.ok(bagList);
	//}
}