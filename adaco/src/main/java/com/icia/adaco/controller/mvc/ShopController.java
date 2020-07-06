package com.icia.adaco.controller.mvc;

import java.io.*;

import javax.inject.*;

import org.springframework.lang.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.icia.adaco.dto.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class ShopController {

	
	@Inject
	private ShopService shopService;
	
	//상점개설 화면
	@GetMapping("/artist/shopMade")
	public ModelAndView shopMade() {
		return new ModelAndView("main").addObject("viewName","artist/shopMade.jsp");
	}
	
	
	//상점개설 처리
	@PostMapping("/artist/shopMade")
	public String shopMade(ShopDto.DtoForMade shopMadeDto, @Nullable MultipartFile sajin, RedirectAttributes ra) throws IllegalStateException, IOException {
			shopService.shopMade(shopMadeDto, sajin);
			return "redirect:/";
	}
	
	
}
