package com.icia.adaco.service.rest;

import java.io.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;

@Service
public class AdminBoardRestService {
	@Autowired
	AdminBoardDao adminBoardDao;
	public void deleteArt(Integer artno) {
		/* 추가되면 할 것
		List<Attachment> list = attachmentDao.findAllByBno(bno);
		for(Attachment a :list) {
			File file = new File("d:/upload/attahment", a.getSaveFileName());
			if(file.exists()==true)
				file.delete();
		} 
		attachmentDao.deleteAllByArtno(artno);
		*/
		adminBoardDao.deleteByArt(artno);
	}

}
