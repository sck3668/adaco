package com.icia.adaco.service.mvc;

import java.io.*;
import java.time.*;
import java.time.format.*;
import java.util.*;

import javax.mail.*;
import javax.validation.constraints.*;

import org.apache.commons.lang3.*;
import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.*;

import com.icia.aboard.entity.*;
import com.icia.aboard.exception.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.UserDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.service.exception.*;
import com.icia.adaco.util.*;

@Service
public class UserService {
	private static final MyPageDto MyPageDto = null;
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
	@Value("d:/upload/profile")
	private String profileFolder;
	@Value("http://localhost:8081/profile/")
	private String profilePath;
	@Autowired
	private ReviewDao reviewDao;
	
	public void join(UserDto.DtoForJoin dto, MultipartFile sajin) throws IllegalStateException, IOException, MessagingException {
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
		//비밀 번호 암호화
		String password = user.getPassword();
		String encodedPassword = pwdEncoder.encode(password);
		user.setPassword(encodedPassword);
		//권한주기 
		String authority= dto.getAuthority();
		//violated - parent key not found
		user.getCheckCode();
		String checkCode = RandomStringUtils.randomAlphanumeric(20);
		user.setCheckCode(checkCode);
		user.setJoinDate(LocalDateTime.now());
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
	
	public UserDto.DtoForRead read(String username) {
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
	public String findByTel(String tel) {
		System.out.println(userDao.findidByCheckTel(tel)+"=======");
		return userDao.findidByCheckTel(tel);
	}
	
	public boolean exsitsUsername(String irum) {
		return userDao.existsUsername(irum);
	}
	public boolean existsEmail(String email) {
		return userDao.existsEmail(email);
	}
	public String findByEmail(String email) {
		return userDao.findidByCheckEmail(email);
	}
	
	public String findByIrum(String irum) {
		String username = userDao.findidByCheckName(irum);
		System.out.println(username+"이거에 유저네임은 뭐야 시발");
		if(username==null)
			throw new JobFailException("이름이 달라달라4달라");
		
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
	//포인트 리스트
	public List<PointDto.DtoForList> pointList(String username){
		List<Point> point = userDao.findAllByPoint(username);
			System.out.println(point+"그냥포인트============");
		List<PointDto.DtoForList> listPoint = new ArrayList<PointDto.DtoForList>();
			System.out.println(listPoint+"리스트포인트위에꺼");
		System.out.println(listPoint+"리스트포인트아래꺼");
		for(Point point1:point) {
			PointDto.DtoForList dto = modelMapper.map(point,PointDto.DtoForList.class);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy년MM월dd일");
		dto.setEndDateStr(point1.getEndDate().format(dtf));
		dto.setStartDateStr(point1.getStartDate().format(dtf));
		dto.setUsername(point1.getUsername());
		dto.setTotalPoint(point1.getTotalPoint());
		dto.setPoint(point1.getPoint());
		listPoint.add(dto);
		
	}
		return listPoint;
}
		
	//페이보릿즐찾리스트
	public List<Favorite> favoriteList(String username){
		System.out.println(username+"gggg");
		return userDao.findAllFavorite(username);
	}
	//유저리뷰함
	public List<Review> reviewList(String username){
		return userDao.listByReviewUser(username);
	}
		
	public int delete(String username) {
		User user = userDao.findByid(username);
		System.out.println(user+"유저");
		if(user.getUsername().equals(username)==false)
			throw new JobFailException("유저가다름");
		return userDao.delete(username);
		
	}
	// 2단계 아이디 찾기 시 랜덤 이름 값
	public List<String> findAllIrum() {
		List<String> list = new ArrayList<String>();
		list.addAll(userDao.findAllIrum());
		ArrayList<String> randomList = new ArrayList<String>();
		Random ra = new Random();
		int maxSize = userDao.findAllIrum().size();
		  for(int i=0; i<maxSize ;i++){
			   int rv = ra.nextInt(list.size());
			   randomList.add(list.get(rv));
			   list.remove(rv);
			  }
		return randomList;
	}
	//2단계 비밀번호 찾기
	public void resetPassword(String username,String email) throws MessagingException {
		User user = userDao.findByid(username);
		System.out.println(user);
		if(user==null)
			throw new UserNotFoundException();
		if(user.getEmail().equals(email)==false)
			throw new UserNotFoundException();
		String newPassword = RandomStringUtils.randomAlphabetic(20);
		userDao.update(User.builder().username(username).password(pwdEncoder.encode(newPassword)).build());
	StringBuffer text = new StringBuffer ("<p>임시 비밀번호 지급</p>");
	text.append("<p>임시비밀번호:").append(newPassword).append("</p>");
	text.append("<p>보안을 위해 로그인후 바로 비밀번호를 변경해주세요</p>");
	Mail mail = Mail.builder().sender("webmaster@icia.com").receiver(email).title("임시비밀번호 발급안내").content(text.toString()).build();
		mailUtil.sendMail(mail);
	}
	public void changePwd(String password, String newPassword, String username) {
		User user = userDao.findByid(username);
		if(user==null)
			throw new UserNotFoundException();
		String encodedPassword = user.getPassword();
		if(pwdEncoder.matches(password, encodedPassword)==true) {
		System.out.println(encodedPassword+"이것이 유저다");
		System.out.println(password+"이것은 패스워드");
		System.out.println(newPassword);
			String newEncodedPassword = pwdEncoder.encode(newPassword);
			userDao.update(User.builder().password(newEncodedPassword).username(username).build());
		}
		else
			throw new JobFailException("잘못된 비밀번호 입니다");
		
	}
}