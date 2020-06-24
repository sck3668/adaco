package com.icia.adaco.util.interceptor;

import javax.servlet.http.*;

import org.springframework.security.core.*;
import org.springframework.security.core.context.*;
import org.springframework.web.servlet.handler.*;
// 인터페이스 -> 어댑터
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 인증정보 객체를 스프링 시큐리티 정보 관지자로 부터 얻어오자
		// 다른 사람 세션 접근 금지
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth.getPrincipal().toString().equals("anonymousUser")==false)
			throw new IllegalAccessError("잘못된 접근입니다.");
		return super.preHandle(request, response, handler);	
	}

}
