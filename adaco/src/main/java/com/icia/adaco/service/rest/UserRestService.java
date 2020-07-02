package com.icia.adaco.service.rest;

import java.io.*;

import javax.validation.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.UserDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.service.exception.*;
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
		if(userDao.existsUsername(username)==true)
			throw new UsernameExistException();
		return true;	
	}

	public boolean checkEmail(String email) {
		if(userDao.existsEmail(email)==true)
			throw new EmailExistException();
		return true;
	}
	public void update(DtoForUpdate dto, MultipartFile sajin) throws IllegalStateException, IOException {
		System.out.println("update");
		// 비밀번호가 존재하는 경우 비밀번호 확인. 실패하면 작업 중지 
		if(dto.getPassword()!=null) {
			User user = userDao.findByid(dto.getUsername());
			if(user==null)
				throw new UserNotFoundException();
			
			String encodedPassword = user.getPassword();
			System.out.println(dto.getPassword()+"ㅎㅎ");
			System.out.println(encodedPassword+"ㅎㅎㅎ");
			if(pwdEncoder.matches(dto.getPassword(), encodedPassword)==false)
				throw new JobFailException("비밀번호를 확인할 수 없습니다");
			
			
			System.out.println(dto.getPassword()+"===============");
			System.out.println(encodedPassword+"================");
	
			dto.setPassword(pwdEncoder.encode(dto.getNewPassword()));
		}
		System.out.println(dto.getPassword()+"ggggggggg");
		User user = modelMapper.map(dto, User.class);
		
		System.out.println("============");
		// 프사 변경없이 바로 update하면 sajin==null
		if(sajin!=null && !sajin.isEmpty()) {
			if(sajin.getContentType().toLowerCase().startsWith("image/")==true) {
				int lastIndexOfDot =  sajin.getOriginalFilename().lastIndexOf('.');
				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot+1);
				File file = new File(profileFolder, user.getUsername() + "." + extension);
				sajin.transferTo(file);
				user.setProfile(profilePath + file.getName());
			}
		}
		System.out.println("gg");
		userDao.update(user);
	}
}
