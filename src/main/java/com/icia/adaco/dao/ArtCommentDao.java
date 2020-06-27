package com.icia.adaco.dao;



import javax.inject.*;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class ArtCommentDao {
	@Inject
	private SqlSessionTemplate tpl;
	public int writeByCommentOfArt(ArtComment artcomment) {
		return tpl.insert("artCommentMapper.insert", artcomment);
	}
	
	public int deleteByCommentOfArt(int cno) {
		return tpl.delete("artCommentMapper.insert", cno);
	}
	

	

}
