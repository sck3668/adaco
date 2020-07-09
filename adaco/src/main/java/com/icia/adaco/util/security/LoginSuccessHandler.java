package com.icia.adaco.util.security;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.web.authentication.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;

@Component("loginSuccessHandler")
public class LoginSuccessHandler extends SimpleUrlAuthenticationFailureHandler{
	@Autowired
	private UserDao userDao;
	@Autowired
	private MessageDao messageDao;
	
	
	
}
