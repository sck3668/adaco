package com.icia.adaco.service.mvc;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;

@Service
public class BagService {
	
	@Autowired
	private BagDao bagDao;
	
	// 장바구니 추가
	@Override
	public void insert(Bag bag) {
		bagDao.insertByBag(bag);
	}
}
