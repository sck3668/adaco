package com.icia.adaco.service.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.adaco.dao.AdminUserDao;
import com.icia.adaco.dao.AuthorityDao;
import com.icia.adaco.entity.User;

@Service
public class AdminUserRestService {
	@Autowired
	AdminUserDao dao;
	@Autowired
	AuthorityDao authorityDao;
	
	public void update(String username, String authority, boolean enabled) {
		
		if(enabled == false) {			
			List<String> list = dao.findOrderById(username);
			for(String state:list) {			
				if(state.equals("구매 확정") == false)
				throw new JobFailException("진행 중인 거래가 있어 블락할 수 없습니다.");
			}
		}
		dao.updateByUser(User.builder().enabled(enabled).username(username).build());
		authorityDao.update(username, authority);
	}

}
