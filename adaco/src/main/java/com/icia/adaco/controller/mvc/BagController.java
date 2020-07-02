package com.icia.adaco.controller.mvc;

import java.security.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.lang.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class BagController {
	@Autowired
	private BagService bagService;
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
	 
	
	  @GetMapping("/bag/list") 
	  public ModelAndView list2() { 
		  return new ModelAndView("main").addObject("viewName","bag/read.jsp"); 
		  }
	 
	
	@GetMapping("/bag/read")
	public ResponseEntity<?> list(String username) {
		System.out.println("bag/list  list1출력");
		List<Bag> bagList = bagService.findAllBagByUsername(username);
		return ResponseEntity.ok(bagList);
	}
	
	
	@PostMapping("/bag/delete")
	public ResponseEntity<?> delete(HttpSession session, int artno) {
		List<Bag> bagList = bagService.deleteByBag(artno);
		System.out.println(bagList+"controller CartList");
		return ResponseEntity.ok(bagList);
	}
}
