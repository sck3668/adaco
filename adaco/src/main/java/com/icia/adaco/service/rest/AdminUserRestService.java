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
			if(dao.existsByArtist(username) == true)
				throw new JobFailException("동일한 권한을 부여할 수 없습니다.");
			Artist artist = Artist.builder().username(username).build();
			dao.insertByArtist(artist);
		}
		
		if(authority.equals("ROLE_USER")) {
			if(dao.existsByArtist(username)==true) {
				List<String> list = dao.findSellById(username);
				for(String state:list) {
					if(state.equals("구매확정") == false)
						throw new JobFailException("진행 중인 거래가 있어 정보를 수정할 수 없습니다.");
				}
				Artist artist = dao.findByArtist(username);
				int artistno = artist.getArtistno();
				dao.deleteByArtist(artistno);
			}
		}
		
		if(enabled == false) {
			if(dao.existsByArtist(username) == true) {
				List<String> list = dao.findSellById(username);
				for(String state:list) {
					if(state.equals("구매확정") == false)
						throw new JobFailException("진행 중인 거래가 있어 정보를 수정할 수 없습니다.");
				}
			} else {
				List<String> list = dao.findOrderById(username);
				for(String state:list) {			
					if(state.equals("구매 확정") == false)
					throw new JobFailException("진행 중인 거래가 있어 정보를 수정 할 수 없습니다.");
				}
			}
		}
		dao.updateByUser(User.builder().enabled(enabled).username(username).build());
		authorityDao.update(username, authority);
	}

}
