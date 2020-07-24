
package com.icia.adaco.service.rest;

import java.io.*;

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
	@Autowired
	private ArtDao artDao;
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	private ArtCommentDao artCommentDao;
	@Autowired
	private ReportDao reportDao;
	
	//유저네임 존재여부 아이디확인
	public boolean checkId(String username) throws UsernameExistException {
		if(userDao.existsUsername(username)==true)
			throw new UsernameExistException();
		return true;	
	}
	
	//이메일 존재여부 이메일 확인
	public boolean checkEmail(String email) {
		if(userDao.existsEmail(email)==true)
			throw new EmailExistException();
		return true;
	}
	
	//즐겨찾기 삭제
	public int favoriteDelete(int favno) {
			Favorite favorite = userDao.findByFavoriteId(favno);
		return	userDao.deleteFavorite(favno);
	}
	
	//회원정보 업데이트
	public void update(DtoForUpdate dto, MultipartFile sajin ) throws IllegalStateException, IOException {
		// 비밀번호가 존재하는 경우 비밀번호 확인. 실패하면 작업 중지 
		if(dto.getPassword()!=null) {
			User user = userDao.findByid(dto.getUsername());
			if(user==null)
				throw new UserNotFoundException();
			dto.setProfile(user.getProfile());
			String encodedPassword = user.getPassword();
			//기존비번과 타이핑한 비밀번호 비교 여부 
			if(pwdEncoder.matches(dto.getPassword(), encodedPassword)==false)
				throw new JobFailException("비밀번호를 확인할 수 없습니다");
			dto.setPassword(pwdEncoder.encode(dto.getNewPassword()));
		}
		User user = modelMapper.map(dto, User.class);
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
		userDao.update(user);
	}
	
	//리뷰 삭제
	public void reviewDelete(int rno) {
		userDao.reviewDelete(rno);
	}
	
	//즐겨찾기 업데이트
	public int favoriteUpdate(String username,int artno) {
		Art art = artDao.readByArt(artno);
		if (art == null)
			throw new JobFailException("작품 정보를 읽어올 수 없습니다.");
		Boolean isFavorite = userDao.existsByFavorite(artno, username);
		if(isFavorite == false) {
			Favorite favorite = Favorite.builder().artno(artno).artName(art.getArtName()).price(art.getPrice()).username(username).build();
			artDao.updateByArt(Art.builder().artno(artno).favoriteCnt(art.getFavoriteCnt()+1).build());
			return userDao.insertFavorite(favorite);
		} else {
			Favorite favorite = userDao.findByArtnoFavoriteId(artno, username);
			userDao.deleteFavorite(favorite.getFavno());
			return artDao.updateByArt(Art.builder().artno(artno).favoriteCnt(art.getFavoriteCnt()-1).build());
		}
	}
	
	//유저 회원탈퇴
	public void userDelete(String username) {
		userDao.delete(username);
	}
	
	//유저네임으로 프로필불러오기
	public String findProfile(String username) {
		User user = userDao.findByid(username);
		return user.getProfile();
	}
	
	//댓글 신고기능
	public int commentReport(int artno,String username,int cno) {
		ArtComment artComment = artCommentDao.readByCommentOfArt(cno);
		Boolean isCheck = reportDao.existsUsername(username, cno);
		if(isCheck==true)
			throw new JobFailException("암궈나");
		//리포트1증가
		artCommentDao.updateByReportCnt(cno);
		return reportDao.insert(username, cno); 
	}
}
