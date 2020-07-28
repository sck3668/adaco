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
import org.springframework.security.core.*;
import org.springframework.security.web.authentication.logout.*;
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
	
	//회원가입 화면
	@GetMapping("/user/join")
	public ModelAndView join() {
		return new ModelAndView("main").addObject("viewName","user/join.jsp");
	}
	
	//내정보화면 
	@PreAuthorize("isAuthenticated()")
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
		} catch (IllegalStateException | IOException | MessagingException e) {
			e.printStackTrace();
		}
		ra.addFlashAttribute("msg", "가입확인메일을 보냈습니다. 확인해주십시오");
		return "redirect:/system/msg";
	}
	
	//로그인 화면
	@GetMapping("/user/login")
	public ModelAndView login() {
		return new ModelAndView("main").addObject("viewName","user/login.jsp");
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
		if(findIdPwd.equals("findId")==true) {
			String irum = userService.findByTel(tel);
			session.setAttribute("irum",irum);
			if(irum!=null) {
				return ResponseEntity.ok("1");
			} else {
				return ResponseEntity.ok("2");
			}
		} else {
			String irum = userService.findByTel(tel);
			session.setAttribute("irum",irum);
			if(irum==null) {
				return ResponseEntity.ok("2");
			}
			return ResponseEntity.ok("3");
		}
	}
	
	// 아이디찾기 2단계 화면
	@GetMapping("/user/findId2")
	public ModelAndView findId2(HttpSession session) {
		String irum = (String) session.getAttribute("irum");
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
		ra.addFlashAttribute("msg","당신의아이디:"+username);
		return "redirect:/user/login";
	}
	
	//비밀번호 찾기
	@GetMapping("/user/resetPwd")
	public ModelAndView resetPassword() {
		return new ModelAndView("main").addObject("viewName","user/reset_pwd.jsp");
	}
	
	//비밀변호 찾기
	@PostMapping("/user/resetPwd")
	public String resetPassword(String username,String email,RedirectAttributes ra) {
		String password = userDao.passwordFindUsername(username);
		try {
			userService.resetPassword(username, email);
			ra.addFlashAttribute("msg","당신의 임시비밀번호는 이메일에있다");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return "redirect:/user/login";
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
	public ModelAndView userRead(Principal principal ) {
		return new ModelAndView("main")
				.addObject("viewName","user/mypage.jsp")
				.addObject("point",userService.totalpoint(principal.getName()))
				.addObject("review",userService.ReviewUsernameFind(principal.getName()))
				.addObject("favorite",userService.FavoriteUsernameCount(principal.getName()))
				.addObject("user",userService.read(principal.getName()));
	}
		
	//포인트 메인화면
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/pointList")
	public ModelAndView userPoint(Principal principal) {
		return new ModelAndView("main")
				.addObject("viewName","user/point.jsp")
				.addObject("totalPoint",userService.totalpoint(principal.getName()))
				.addObject("point",userService.pointList(principal.getName()));
	}
	
	//리뷰 리스트
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/reviewList")
	public ModelAndView userReview(Principal principal) {
		return new ModelAndView("main")
				.addObject("viewName","user/reviewList.jsp")
				.addObject("Review",userService.reviewList(principal.getName()));
	}
	
	//즐겨찾기 화면 리스트
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/favoriteList")
	public ModelAndView favoriteList(Principal principal) {
		return new ModelAndView("main")
				.addObject("viewName","user/favoriteList.jsp")
				.addObject("favorite",userService.favoriteList(principal.getName()));
	}
	
//	//메시지 리스트함
//	@PreAuthorize("isAuthenticated()")
//	@GetMapping("/user/messageList")
//	public ModelAndView messageList(Principal principal) {
//		return new ModelAndView("main").addObject("viewName","user/messageList.jsp");
//	}
	
	//회원 삭제
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/user/delete")
	public String delete(SecurityContextLogoutHandler handler, HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
		userService.delete(authentication.getName());
		handler.logout(request, response, authentication);
		return "redirect:/";
	}
	
	//비밀번호 변경 화면
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/changePwd")
	public ModelAndView changePwd() {
		return new ModelAndView("main").addObject("viewName","user/changePwd.jsp");
	}
	
	//비밀번호변경
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/user/changePwd")
	public String changePwd(String password,String newPassword, Principal principal, RedirectAttributes ra) {
		userService.changePwd (password,newPassword, principal.getName());
		ra.addFlashAttribute("msg", "비밀번호를 변경했습니다");
		return "redirect:/";
	}
	
	//유저가 보는 주문 목록
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/orderList")
	public ModelAndView userOrderList(@RequestParam(defaultValue ="1")int pageno,Principal principal) {
		return new ModelAndView("main")
				.addObject("viewName","user/orderList.jsp")
				.addObject("page",userService.orderList(pageno,principal.getName()));
	}
	
	//유저가 보는 주문 상세내역
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/user/orderRead")
	public ModelAndView userOrderRead(Principal principal,int orderno) {
		System.out.println("orderno1111"+orderno);
		return new ModelAndView("main")
				.addObject("viewName","user/orderRead.jsp")
				.addObject("orderDetail",userService.userOrderRead(principal.getName(),orderno));
	}
	
	
}
