package com.icia.adaco.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;
@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate sql;

	public boolean existsUsername(String username) {
		return sql.selectOne("userMapper.existsUsername",username);
	}
	public boolean existsEmail(String email) {
		return sql.selectOne("userMapper.existsEmail",email);
	}
	public String findidByCheckTel(String tel) {
		return sql.selectOne("userMapper.findidByCheckTel",tel);
	}
	public String findidByCheckName(String irum) {
		return sql.selectOne("userMapper.findidByCheckName",irum);
	}
	public String findidByCheckEmail(String email) {
		return sql.selectOne("userMapper.findidByCheckEmail",email);
	}
	public User findByid(String username) {
		return sql.selectOne("userMapper.findById",username);
	}
	
	public int insert (User user) {
		return sql.insert("userMapper.insert",user);
	}
	public int update (User user) {
		return sql.update("userMapper.update",user);
	}
	public int delete(String username) {
		return sql.delete("userMapper.delete",username);
	}
}
