package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;
import java.time.*;

import javax.mail.*;
import javax.servlet.http.*;
import javax.validation.*;
import javax.validation.constraints.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.lang.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.service.mvc.*;
import com.icia.adaco.util.editor.*;

@Controller
public class UserController {
	@InitBinder
	public void init(WebDataBinder wdb) {
		wdb.registerCustomEditor(LocalDateTime.class, "birthDate", new DatePropertyEditor());
	}
	
	@Autowired
	private UserService userService;
	@Autowired
	private UserDao userDao;
	private ArtService artService;
	//회원가입 화면
	@GetMapping("/user/join")
	public ModelAndView join() {
		return new ModelAndView("main").addObject("viewName","user/join.jsp");
	}
	//내정보화면 
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/read")
	public ModelAndView read(Principal principal) {
		  return new ModelAndView("main")
				  .addObject("viewName","user/read.jsp")
				  .addObject("user",userService.read(principal.getName()));
	}
	//회원가입 처리
	@PostMapping("/user/join")
	public String join(@Valid UserDto.DtoForJoin dto, BindingResult bindingResult, @Nullable MultipartFile sajin, RedirectAttributes ra) throws BindException {
		System.out.println("controller");
		if(bindingResult.hasErrors()==true) 
			throw new BindException(bindingResult);
		try {
			userService.join(dto, sajin);
			System.out.println("========");
			System.out.println("gg");
		} catch (IllegalStateException | IOException | MessagingException e) {
			e.printStackTrace();
			System.out.println("ggg");
			System.out.println("=============msgg");
		}
		ra.addFlashAttribute("msg", "가입확인메일을 보냈습니다. 확인해주십시오");
		return "redirect:/system/msg";
	}
	//로그인 화면
	@GetMapping("/user/login")
	public ModelAndView login() {
		return new ModelAndView("main").addObject("viewName","user/login.jsp");
	}
	//메인
	@GetMapping("/")
	public ModelAndView main() {
		return new ModelAndView("main").addObject("viewName","user/section.jsp");
	}
	// 아이디 비밀번호 찾기 화면
	// 휴대폰 인증화면
	@GetMapping("/user/findIdPwd")
	public ModelAndView findIdPwd() {
		return new ModelAndView("main").addObject("viewName","user/find_id_pwd.jsp");
										
	}
	
	// 아이디찾기 인지 비밀번호 찾기인지 라디오값 확인후 각각의 화면으로 이동
	// 아이디 찾기 체크 시 findIdPwd의 의 값이 findId.
	// 입력한 핸드폰번호로 찾은 username이 존재하면 2단계 인증으로
	// false면 비밀번호 찾기므로 비밀번호 찾기로 이동
	@PostMapping("/user/findIdPwd")
	public ResponseEntity<String> findIdPwd(String findIdPwd,String tel,HttpSession session) {
		System.out.println("findIdPwd===="+findIdPwd);
		System.out.println("tel========"+tel);
		if(findIdPwd.equals("findId")==true) {
			String irum = userService.findByTel(tel);
			System.out.println(irum+"=======");
			session.setAttribute("irum",irum);
			System.out.println(session.getAttribute("irum")+"================ㅋㅋ");
			if(irum!=null) {
				return ResponseEntity.ok("1");
			} else {
				return ResponseEntity.ok("2");
			}
		} else {
			return ResponseEntity.ok("3");
		}
	}
	
	// 아이디찾기 2단계 화면
	@GetMapping("/user/findId2")
	public ModelAndView findId2(HttpSession session) {
		String irum = (String) session.getAttribute("irum");
		System.out.println(irum+"gg");
		session.removeAttribute("irum");
		return new ModelAndView("main")
				.addObject("viewName","user/find_id2.jsp")
				.addObject("irum",irum).addObject("irumAll",userService.findAllIrum());
				
	}
	
	// 아이디찾기 2단계는 이름확인
	// 핸드폰 인증한 회원의 이름이 존재하는 아이디면 username출력하고 로그인버튼
	@PostMapping("/user/findId2")
	public String findId2(String irum,RedirectAttributes ra) {
		String username = userService.findByIrum(irum);
		System.out.println(username);
		ra.addFlashAttribute("msg","당신의아이디:"+username);
		System.out.println(username+"ggggggggggggg");	
		return "redirect:/user/login";
	}
	//비밀번호변경
	@GetMapping("/user/resetPwd")
	public ModelAndView resetPassword() {
		return new ModelAndView("main").addObject("viewName","user/reset_pwd.jsp");
	}
	//회원가입 체크
	@GetMapping("/user/join_check")
	public String joinCheck(@RequestParam @NotNull String checkCode) {
		userService.joinCheck(checkCode);
		return "redirect:/user/login";
	}
	//마이페이지 화면
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/mypage")
	public ModelAndView userRead() {
		return new ModelAndView("main").addObject("viewName","user/mypage.jsp");
	}
		
	//포인트 메인화면
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/pointList")
	public ModelAndView userPoint(Principal principal) {
		System.out.println(userService.pointList(principal.getName()));
		return new ModelAndView("main").addObject("viewName","user/point.jsp")
				.addObject("point",userService.pointList(principal.getName()));
	}
	//리뷰 리스트
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/reviewList")
	public ModelAndView userReview(Principal principal) {
		return new ModelAndView("main")
				.addObject("viewName","user/reviewList.jsp")
				.addObject("Review",userService.reviewList(principal.getName()));
	}
	//즐겨찾기 화면 리스트
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/favoriteList")
	public ModelAndView favoriteList(Principal principal) {
		System.out.println(userService.favoriteList(principal.getName())+"컨트롤러");
		return new ModelAndView("main")
				.addObject("viewName","user/favoriteList.jsp")
				.addObject("favorite",userService.favoriteList(principal.getName()));
	}
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/messageList")
	public ModelAndView messageList(Principal principal) {
		return new ModelAndView("main").addObject("viewName","user/messageList.jsp");
	}
	@PostMapping("/user/delete")
	public int delete(Principal principal) {
			System.out.println(principal.getName()+"로그인한아이디");
		return userService.delete(principal.getName());
	}
	
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/changePwd")
	public ModelAndView changePwd() {
		return new ModelAndView("main").addObject("viewName","user/changePwd.jsp");
	}
	
	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/user/changePwd")
	public String changePwd(@RequestParam @NotNull String password, @RequestParam @NotNull String newPassword, Principal principal, RedirectAttributes ra) {
		//userService.changePwd(password, newPassword, principal.getName());
		ra.addFlashAttribute("msg", "비밀번호를 변경했습니다");
		return "redirect:/";
	}
}
