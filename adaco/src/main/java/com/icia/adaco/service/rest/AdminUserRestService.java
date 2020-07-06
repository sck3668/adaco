package com.icia.adaco.service.rest;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;

@Service
public class AdminUserRestService {
	@Autowired
	AdminUserDao dao;
	@Autowired
	AuthorityDao authorityDao;
	
	public void update(String username, String authority, boolean enabled) {
		if(authority.equals("ROLE_SELLER")) {
			Artist artist = Artist.builder().username(username).build();
			dao.insertByArtist(artist);
		}
		
		if(dao.existsByArtist(username)==true) {
			if(enabled == false || authority != "ROLE_ADMIN") {
				List<String> list = dao.findSellById(username);
				for(String state:list) {
					if(state.equals("구매 확정") == false)
					throw new JobFailException("진행 중인 거래가 있어 정보를 수정 할 수 없습니다.");
				}
			}
		}
		
		if(enabled == false) {			
			List<String> list = dao.findOrderById(username);
			for(String state:list) {			
				if(state.equals("구매 확정") == false)
				throw new JobFailException("진행 중인 거래가 있어 정보를 수정 할 수 없습니다.");
			}
		}
		
		dao.updateByUser(User.builder().enabled(enabled).username(username).build());
		authorityDao.update(username, authority);
	}

}
