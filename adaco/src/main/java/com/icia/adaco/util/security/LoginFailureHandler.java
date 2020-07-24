package com.icia.adaco.util.security;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.*;
import org.springframework.security.web.*;
import org.springframework.security.web.authentication.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;

@Component("loginFailureHandler")
public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{
	@Autowired
	private UserDao dao;
	private RedirectStrategy rs = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String username = request.getParameter("username");
		HttpSession session = request.getSession();
		      if(exception instanceof BadCredentialsException) {
		    	  User user = dao.findByid(username);
		    	  if(user==null) {
		    		  session.setAttribute("msg", "아이디를 찾을수없습니다");
		    	  } else {
		    		  int loginFailureCnt = user.getLoginFailureCnt()+1;
		    		  if(loginFailureCnt<5) {
		    			  dao.update(User.builder().username(username).loginFailureCnt(loginFailureCnt).build());
		    			  session.setAttribute("msg", loginFailureCnt+"회 실패했습니다");
		    		  } else {
		    			  dao.update(User.builder().username(username).loginFailureCnt(loginFailureCnt).enabled(false).build());
		    			  session.setAttribute("msg", "로그인에 5회 실패해 게정이 블록되었습니다");
		    		  }
		    	  }
		      } else if(exception instanceof DisabledException) {
		    	  session.setAttribute("msg", "블록되었습니다. 관리자 문의 필요");
		      }
		      rs.sendRedirect(request, response, "/user/login");
	}
}
