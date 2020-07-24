package com.icia.adaco.util.security;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.security.web.*;
import org.springframework.security.web.authentication.*;
import org.springframework.security.web.savedrequest.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;

@Component("loginSuccessHandler")
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	@Autowired
	private UserDao userDao;
	@Autowired
	private MessageDao messageDao;
	@Autowired
	private AuthorityDao authorityDao;
	// 사용자가 가려던 목적지를 저장하는 객체
	private RequestCache cache = new HttpSessionRequestCache();
	// 리다이렉트 해주는 객체
	private RedirectStrategy rs = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		
		String username = authentication.getName();
		String password = request.getParameter("password");
		if(password.length()>=20) {
			session.setAttribute("msg","임시비밀번호로 로그인하셨습니다. 비밀번호를 변경해주세요");
			rs.sendRedirect(request, response, "/user/changePwd");
		} else {
			User user = User.builder().username(authentication.getName()).loginFailureCnt(0).build();
			userDao.update(user);

			// 일반회원권한으로 로그인 시 메인화면
			if(authorityDao.findByUsername(username).equals("ROLE_USER")) {
				rs.sendRedirect(request, response, "/art/listByUser");
			}
			// 작가 회원으로 로그인 시 메인화면
			else if(authorityDao.findByUsername(username).equals("ROLE_SELLER")) {
				rs.sendRedirect(request, response, "/art/listByArtist");
			}
			// 관리자로 로그인 시 메인화면
			else if(authorityDao.findByUsername(username).equals("ROLE_ADMIN")) {
				rs.sendRedirect(request, response, "/admin/");
			}
		}
	}
}
