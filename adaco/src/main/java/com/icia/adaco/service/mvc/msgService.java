package com.icia.adaco.service.mvc;

import java.time.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.scheduling.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.util.websocket.*;
@Service
public class msgService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private MessageDao msgDao;
	@Autowired
	private MessageWebSocketHandler handler;
	
	
	public List<Message> findBySender(String username) {
		return msgDao.findAllBySender(username);
	}

	public List<Message> findByReceiver(String username) {
		return msgDao.findAllByReceiver(username);
	}

	public Message findById(Integer mno) throws MessageNotFoundException {
		Message msg = msgDao.findById(mno);
		if(msg==null)
			throw new MessageNotFoundException();
		msgDao.setRead(mno);
		return msg;
	}

	public void send(Message msg) {
		User user = userDao.findByid(msg.getRecipientId());
		if(user==null)
			throw new JobFailException("받는 사용자를 확인하지 못했습니다");
		System.out.println("msg==="+msg);
		msg.setUsername(msg.getSendId());
		msg.setWriteDate(LocalDateTime.now());
		msg.setMsgCheck(false);
		System.out.println("msg111=="+msg);
		msgDao.insert(msg);
		handler.sendMessage(msg.getSendId(), msg.getRecipientId(), msg.getTitle());
	}
	
	@Scheduled(cron="0 0 4 1/1 * ?")
	public void delete() {
		msgDao.delete();
	}
}
