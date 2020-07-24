package com.icia.adaco.service.rest;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;

@Service
public class msgRestService {
	@Autowired
	private MessageDao msgDao;
	
	public void disableBySender(List<Integer> list) {
		msgDao.disableBySender(list);
	}
	
	public void disableByReceiver(List<Integer> list) {
		System.out.println("list=="+list);
		msgDao.disableByReceiver(list);
	}
}
