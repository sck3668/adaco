package com.icia.adaco.service.mvc;

import java.io.*;
import java.security.*;
import java.time.*;

import javax.mail.*;
import javax.validation.constraints.*;

import org.apache.commons.lang3.*;
import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.util.*;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private AuthorityDao authorityDao;
	@Autowired
	private PasswordEncoder pwdEncoder;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private MailUtil mailUtil;
	@Value("${profileFolder}")
	private String profileFolder;
	@Value("${profilePath}")
	private String profilePath;
	
	public void join(UserDto.DtoForJoin dto, MultipartFile sajin) throws IllegalStateException, IOException, MessagingException {
		System.out.println("uservice=============");
		User user = modelMapper.map(dto, User.class);
		if(sajin!=null && sajin.isEmpty()==false) {
			if(sajin.getContentType().toLowerCase().startsWith("image/")==true) {
				int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf('.');
				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot+1);
				File profile = new File(profileFolder, user.getUsername() + "." + extension);
			
				sajin.transferTo(profile);
				user.setProfile(profilePath + profile.getName());
			} else {
				// 프사라고 올린 파일이 사진이 아닌 경우 -> anony.jpg
				user.setProfile(profilePath + "anony.jpg");
			}
		} else {
			// 프사를 안올린 경우 -> anony.jpg
			user.setProfile(profilePath + "anony.jpg");
		}
		String password = user.getPassword();
		String encodedPassword = pwdEncoder.encode(password);
		System.out.println("encodedPassword====="+encodedPassword);
		System.out.println("encodedPassword====="+password);
		user.setPassword(encodedPassword);
		
		//integrity constraint (ADACO.FK_USERS_TO_AUTHORITIES)
		//violated - parent key not found
		
		String checkCode = RandomStringUtils.randomAlphanumeric(10);
		user.setCheckCode(checkCode);
		user.setJoinDate(LocalDateTime.now());
		user.setAddress("인천");
		user.setBirthDate(LocalDateTime.now());
		System.out.println("user============"+user);
		userDao.insert(user);
		
		/* List<String> authorities = dto.getAuthorities(); */
		/* for(String authority:authorities) */ 
			authorityDao.insert(user.getUsername(), "ROLE_USER");
		
		String link = "<a href='http://localhost:8081/adaco/user/join_check?checkCode=" + checkCode + "'>";
		StringBuffer sb = new StringBuffer("<p>회원가입을 위한 안내 메일입니다</p>");
		sb.append("<p>가입 확인을 위해 아래 링크를 클릭해 주세요</p>");
		sb.append("<p>로그인 하기 : ");
		sb.append(link);
		sb.append("클릭하세요</a></p>");
		String msg = sb.toString();
		Mail mail = Mail.builder().sender("webmaster@icia.com")
				.receiver(user.getEmail()).title("회원가입 안내")
				.content(msg).build();
		mailUtil.sendMail(mail);
		
	}
	
	public User read(String username) {
		User user = userDao.findByid(username);
		if(user==null)
			throw new JobFailException("유저가없다");
		
		return userDao.findByid(username);
	}
	
	public String findByTel(String tel) {
		return userDao.findidByCheckTel(tel);
	}
	
	public boolean exsitsUsername(String irum) {
		return userDao.existsUsername(irum);
	}
	
	public String findByIrum(String irum) {
		return userDao.findidByCheckName(irum);
	}
	
	public void joinCheck(@NotNull String checkCode) {
			String username = userDao.findJoinCheckCode(checkCode);
			/*
			 * if(username==null) throw new UserNotFoundException();
			 */
			User u = User.builder().enabled(true).checkCode(checkCode).username(username).build();
			userDao.update(u);
		
	}
}