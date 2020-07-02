package com.icia.adaco.service.mvc;

import java.time.format.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.util.*;

@Service
public class AdminUserService {
	@Autowired
	AdminUserDao dao;
	@Autowired
	AuthorityDao authorityDao;
	@Autowired
	ModelMapper modelMapper;

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
		
//		for(Artist artist:artistList) {
//		    AdminUserDto.DtoForArtistList dto = modelMapper.map(artist, AdminUserDto.DtoForArtistList.class);
//		    User user = dao.findByid(artist.getUsername());
//		    dto.setJoinDateStr(user.getJoinDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
//			dtoList.add(dto); 
//		}
		
		page.setAdminArtist(dtoList);
		return page;
	}


	
}
