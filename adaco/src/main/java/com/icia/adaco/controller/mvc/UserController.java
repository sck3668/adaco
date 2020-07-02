package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;
import java.time.*;

import javax.mail.*;
import javax.validation.*;
import javax.validation.constraints.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.lang.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.exception.*;
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
	//회원가입 화면
	@GetMapping("/user/join")
	public ModelAndView join() {
		return new ModelAndView("main").addObject("viewName","user/join.jsp");
	}
	//내정보화면 
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/read")
	public ModelAndView read(Principal principal) {
		System.out.println("ggg리드좀 보자 시발ㅎㅎ홓ㄴㅇㅎㅇㄶㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇ");
		  userService.read(principal.getName());
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
	public ResponseEntity<String> findIdPwd(String findIdPwd,String tel) {
		if(findIdPwd.equals("findId")==true) {
			String username = userService.findByTel(tel);
			System.out.println(username);
			if(username!=null) {
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
	public ModelAndView findId2() {
		return new ModelAndView("main")
				.addObject("viewName","user/find_id2.jsp");
	}
	
	// 아이디찾기 2단계는 이름확인
	// 핸드폰 인증한 회원의 이름이 존재하는 아이디면 username출력하고 로그인버튼
	@PostMapping("/user/findId2")
	public String findId2(String irum) {
		if(irum.equals(userService.exsitsUsername(irum))==true) {
			String username = userService.findByIrum(irum);
		};
		return "redirect:/user/findId3";
	}
	// 아이디찾기 3단계 확인
	@GetMapping("/user/findId3")
	public ModelAndView findId31() {
		return new ModelAndView("main").addObject("viewName","user/find_id3.jsp");
	}
	@PostMapping("/user/findId3")
	public String findId3(String email) {
		if(email.equals(userService.existsEmail(email))==false) {
			throw new JobFailException("이메일잉 틀려요");
		}
		return "redirect:/sysytem/msg";
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
	@GetMapping("/user/mypage")
	public ModelAndView userRead() {
		return new ModelAndView("main").addObject("viewName","user/mypage.jsp");
	}
}
