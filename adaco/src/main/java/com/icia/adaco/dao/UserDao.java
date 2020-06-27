package com.icia.adaco.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;
@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate sql;

	public boolean existsUsername(String username) {
		return sql.selectOne("userMapper.existsUsername",username)!=null;
	}
	public boolean existsEmail(String email) {
		return sql.selectOne("userMapper.existsEmail",email)!=null;
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
	public int insertpoint(Point point) {
		return sql.insert("userMapper.insertpoint",point);
	}
	public List<Point> findAllByPoint() {
		return sql.selectList("userMapper.findAllByPoint"); 
	}
	public String findJoinCheckCode(String checkCode) {
		return sql.selectOne("userMapper.findJoinCheckCode",checkCode);
	}
	public List<Favorite> findAllFavorite()	{
		return sql.selectList("userMapper.findAllFavorite");
	}
	public int insertFavorite(Favorite favorite) {
		return sql.insert("userMapper.insertFavorite",favorite);
	}
	public int deleteFavorite(int favno) {
		return sql.delete("userMapper.deleteFavorite",favno);
		
	}
}
