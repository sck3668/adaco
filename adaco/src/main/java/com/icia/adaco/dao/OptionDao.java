package com.icia.adaco.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class OptionDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	// 옵션 등록
	public int writeByOption(Option option) {
		return tpl.insert("optionMapper.insert",option);
	}
	
	// 옵션 삭제
	public int deleteByOption(int optno) {
		return tpl.delete("optionMapper.delete",optno);
	}
	
	// 옵션 수정
	public int updateByOption(Option option) {
		return tpl.update("optionMapper.update",option);
	}
	
}