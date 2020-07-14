package com.icia.adaco.service.mvc;

import java.time.format.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.exception.*;

@Service
public class ArtistService {
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private UserDao userDao;
	
	public UserDto.DtoForRead artistRead(String username) {
		User user = userDao.findByid(username);
		if(user==null)
			throw new UserNotFoundException();
		user.getProfile();
		//생일
		UserDto.DtoForRead dto = modelMapper.map(user,UserDto.DtoForRead.class);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		dto.setBirthDateStr(user.getBirthDate().format(dtf));
		System.out.println(dto.getProfile()+"사진 프로필 사진");
		
		return dto;
		
	}
}

