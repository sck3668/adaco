package com.icia.adaco.service.rest;

import java.time.format.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.lang.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.service.mvc.*;

@Service
public class AdminUserRestService {
	@Autowired
	AdminUserDao dao;
	@Autowired
	AuthorityDao authorityDao;
	@Autowired
	msgService msgService;
	
	public void update(String username, String authority, Boolean enabled, String sender) {
		
		if(authority != null && authority.equals("ROLE_SELLER")) {
			if(dao.existsByArtist(username) == true)
				throw new JobFailException("동일한 권한을 부여할 수 없습니다.");
			Artist artist = Artist.builder().username(username).build();
			dao.insertByArtist(artist);
			authorityDao.update(username, authority);
//			메시지 보내기 파트
			User user = dao.findByid(username);
			if(user == null)
				throw new JobFailException("받는 사용자를 확인하지 못했습니다.");
			Message message = new Message();
			message.setTitle("회원님의 작가 등록을 진심으로 환영합니다.<br>");
			message.setContent("회원님의 작가 신청 심사 결과<br>작가 자격에 부족함이 없다 판단하여<br>본 핸드스토리의 정식작가로 등록되었음을 알려드립니다.<br>이후 상점을 등록하여 정상적인 작가 활동이 가능하오니 <br>향후 활발한 활동 부탁드립니다 감사합니다.");
			message.setSendId(sender);
			message.setRecipientId(username);
			msgService.send(message);
		}
		
		if(authority != null && authority.equals("ROLE_USER")) {
			if(dao.existsByArtist(username)==true) {
				List<String> list = dao.findSellById(username);
				for(String state:list) {
					if(state.equals("구매확정") == false)
						throw new JobFailException("진행 중인 거래가 있어 정보를 수정할 수 없습니다.");
				}
				Artist artist = dao.findByArtist(username);
				int artistno = artist.getArtistno();
				dao.deleteByArtist(artistno);
				authorityDao.update(username, authority);
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
			dao.updateByUser(User.builder().enabled(enabled).username(username).build());
			return;
		} 
		if (enabled == true) {
			dao.updateByUser(User.builder().enabled(enabled).username(username).build());
			return;
		}
	}

}
