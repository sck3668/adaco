package com.icia.adaco.controller.mvc;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
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
	
	@GetMapping("/bag/list")
	public ModelAndView list() {
		return new ModelAndView("main").addObject("viewName","bag/read.jsp").addObject("list1",bagService.listByArt(35));
	}
	

	@PostMapping("/bag/delete")
	public ResponseEntity<?> delete(HttpSession session, int artno) {
		List<Art> cartList = bagService.deleteByBag(artno);
		return ResponseEntity.ok(cartList);
	}
}
