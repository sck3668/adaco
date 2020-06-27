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
	ModelMapper modelMapper;

	public Page list(int pageno) {
		int countOfBoard = dao.countByUser(null);
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<User> userList = dao.findAllByUser(srn, ern);
		List<AdminUserDto.DtoForUserList> dtoList = new ArrayList<AdminUserDto.DtoForUserList>();
		for(User user:userList) {
			AdminUserDto.DtoForUserList dto = modelMapper.map(user, AdminUserDto.DtoForUserList.class);
			dto.setJoinDateStr(user.getJoinDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			System.out.println("JJJJJJJJ"+dto.getJoinDateStr());
			dtoList.add(dto);
		}
		page.setAdminUserList(dtoList);
		return page;
	}

	
}
