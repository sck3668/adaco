package com.icia.adaco.util;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class MemoMessageFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void destroy() {
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();

		if(session.getAttribute("msg")!=null) {
			req.setAttribute("msg", session.getAttribute("msg"));
			session.removeAttribute("msg");
		}
		
		System.out.println("필터 메시지");
		System.out.println(session.getAttribute("memoMsg"));
		
		if(session.getAttribute("memoMsg")!=null) {
			req.setAttribute("memoMsg", session.getAttribute("memoMsg"));
			session.removeAttribute("memoMsg");
		}
		
		chain.doFilter(request, response);
	}
}
