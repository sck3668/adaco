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
