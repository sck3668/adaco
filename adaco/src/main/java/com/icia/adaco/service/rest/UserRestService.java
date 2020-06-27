package com.icia.adaco.service.rest;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;

import com.icia.adaco.exception.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.exception.*;
@Service
public class UserRestService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private PasswordEncoder pwdEncoder;
	@Autowired
	private ModelMapper modelMapper;
	@Value("d:/upload/profile")
	private String profileFolder;
	@Value("http://localhost:8081/profile/")
	private String profilePath;
	
	public boolean checkId(String username) throws UsernameExistException {
		System.out.println("urestService=============");
		if(userDao.existsUsername(username)==true)
			throw new UsernameExistException();
		return true;	
	}

	public boolean checkEmail(String email) {
		if(userDao.existsEmail(email)==true)
			throw new EmailExistException();
		return true;
}
}
