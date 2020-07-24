package com.icia.adaco.service.mvc;

import java.time.*;
import java.time.format.*;
import java.time.temporal.*;
import java.util.*;

import javax.annotation.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.util.*;

import lombok.*;

@Service
public class AdminUserService {
	@Autowired
	AdminUserDao dao;
	@Autowired
	AuthorityDao authorityDao;
	@Autowired
	ModelMapper modelMapper;
	@Getter
	List<String> authorityType;
	
	@PostConstruct
	public void init() {
		authorityType = dao.findAuthority();
	}
	
	public Page userList(int pageno, String username) {
		int countOfBoard = dao.countByUser(username);
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		page.setSearch(username);
		List<User> userList = dao.findAllByUser(srn, ern, username);
		List<AdminUserDto.DtoForUserList> dtoList = new ArrayList<AdminUserDto.DtoForUserList>();
		for(User user:userList) {
			AdminUserDto.DtoForUserList dto = modelMapper.map(user, AdminUserDto.DtoForUserList.class);
			dto.setJoinDateStr(user.getJoinDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dtoList.add(dto);
		}
		page.setAdminUserList(dtoList);
		return page;
	}
	
	public Page artistList(int pageno, String username) {
		int countOfBoard = dao.countByArtist(username);
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Map<String, Object>> artistList = dao.findAllByArtist(srn, ern, username);
		List<AdminUserDto.DtoForArtistList> dtoList = new ArrayList<AdminUserDto.DtoForArtistList>();
		for(Map<String, Object> map : artistList) {
			AdminUserDto.DtoForArtistList dto = modelMapper.map(map, AdminUserDto.DtoForArtistList.class);
			User user = dao.findByid(dto.getUsername());
			dto.setJoinDateStr(user.getJoinDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dtoList.add(dto);
		}
		page.setAdminArtist(dtoList);
		return page;
	}

	public AdminUserDto.DtoForUserRead userRead(String username) {
		User user = dao.findByid(username);
		if(user == null)
			throw new JobFailException("유저를 찾을 수 없습니다.");
		AdminUserDto.DtoForUserRead dto = modelMapper.map(user, AdminUserDto.DtoForUserRead.class);
		Authorities authority = dao.findAuthorityById(username);
		dto.setAuthority(authority.getAuthority());
		dto.setJoinDateStr(user.getJoinDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
		dto.setBirthDateStr(user.getBirthDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
		LocalDate joinDate = user.getJoinDate().toLocalDate();
		LocalDate today = LocalDate.now();
		long days = ChronoUnit.DAYS.between(joinDate, today);
		dto.setDays(days);
		return dto;
	}
}
