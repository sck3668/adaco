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

@Component("LoginFailureHandler")
public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{
	@Autowired
	private UserDao dao;
	private RedirectStrategy rs = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String username = request.getParameter("username");
		System.out.println(username+"이거는 실패햇을경우");
		HttpSession session = request.getSession();
		      if(exception instanceof BadCredentialsException) {
		    	  User user =dao.findByid(username);
		    	  if(user==null)
		    		  session.setAttribute("msg", "아이디를 찾을수없습니다둥");
		    	  
		      }
		      
		      
		      rs.sendRedirect(request, response, "/user/login");
	}
}
