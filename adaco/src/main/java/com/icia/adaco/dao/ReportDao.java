package com.icia.adaco.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;

@Repository
public class ReportDao {
	@Autowired
	private SqlSessionTemplate sql;
	
	public Boolean existsUsername(String username,int cno) {
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("username",username);
		map.put("cno",cno);
		return sql.selectOne("reportMapper.existsUsername",map);
	}
	
	public int insert(String username,int cno ) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("username",username);
		map.put("cno",cno);
		return sql.insert("reportMapper.insert",map);
	}
}
