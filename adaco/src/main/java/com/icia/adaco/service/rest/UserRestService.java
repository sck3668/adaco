package com.icia.adaco.service.rest;

import java.io.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
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
	@Autowired
	private ArtDao artDao;
	private ArtistDao artistDao;
	
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
	
	public void delete(String username,int favno) {
		Favorite favorite = userDao.findByFavoriteId(favno);
		if(favorite.getUsername().equals(username)==false)
			throw new JobFailException("유저가 다르다");
		System.out.println(favorite+"페이보릿 레스트");
		
			userDao.deleteFavorite(favno);
	}
	public void update(DtoForUpdate dto, MultipartFile sajin) throws IllegalStateException, IOException {
		// 비밀번호가 존재하는 경우 비밀번호 확인. 실패하면 작업 중지 
		if(dto.getPassword()!=null) {
			User user = userDao.findByid(dto.getUsername());
			if(user==null)
				throw new UserNotFoundException();
			
			String encodedPassword = user.getPassword();
			if(pwdEncoder.matches(dto.getPassword(), encodedPassword)==false)
				throw new JobFailException("비밀번호를 확인할 수 없습니다");
			dto.setPassword(pwdEncoder.encode(dto.getNewPassword()));
			System.out.println(dto+"서비스쪽 업데이트");
			
		}
		User user = modelMapper.map(dto, User.class);
		System.out.println(user+"이거는 유저다");
		// 프사 변경없이 바로 update하면 sajin==null
		if(sajin!=null && !sajin.isEmpty()) {
			if(sajin.getContentType().toLowerCase().startsWith("image/")==true) {
				int lastIndexOfDot =  sajin.getOriginalFilename().lastIndexOf('.');
				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot+1);
				File file = new File(profileFolder, user.getUsername() + "." + extension);
				sajin.transferTo(file);
				user.setProfile(profilePath + file.getName());
				System.out.println(sajin+"이것은 사진서비스쪽");
			}
		}
		System.out.println(sajin+"이것은 사진서비스쪽 아래꺼");
		userDao.update(user);
	}
	
	public int favoriteAdd(String username,int artno) {
		Art art = artDao.readByArt(artno);
		Favorite favorite = Favorite.builder().artno(artno)
				.artName(art.getArtName()).price(art.getPrice()).username(username).build();
		System.out.println("art============"+art);
		System.out.println("favorite==========="+favorite);
		artDao.updateByArt(Art.builder().artno(artno).favorite(true).build());
		return userDao.insertFavorite(favorite);
	}
}
