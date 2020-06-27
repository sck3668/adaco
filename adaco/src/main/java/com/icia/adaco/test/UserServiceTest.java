package com.icia.adaco.test;

import static org.junit.Assert.*;

import java.io.*;
import java.time.*;
import java.util.*;

import javax.mail.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.UserDto.*;
import com.icia.adaco.service.mvc.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class UserServiceTest {
	@Autowired
	private UserService userService;
	@Autowired
	private AuthorityDao dao;
	
	@Test
	public void aaaTest() {
		dao.insert("spring23232", "ROLE_USER");
	}
	
	//@Test
	public void joinTest() throws IllegalStateException, IOException, MessagingException {
		

	}
	
	

