package com.icia.adaco.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.entity.*;
@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate tpl;

	public boolean existsUsername(String username) {
		return tpl.selectOne("userMapper.existsUsername",username)!=null;
	}
	
	public boolean existsEmail(String email) {
		return tpl.selectOne("userMapper.existsEmail",email)!=null;
	}
	
	public String findidByCheckTel(String tel) {
		return tpl.selectOne("userMapper.findidByCheckTel",tel);
	}
	
	public String findidByCheckName(String irum) {
		return tpl.selectOne("userMapper.findidByCheckName",irum);
	}
	
	public String findidByCheckEmail(String email) {
		return tpl.selectOne("userMapper.findidByCheckEmail",email);
	}
	
	public User findByid(String username) {
		return tpl.selectOne("userMapper.findById",username);
	}
	
	public int insert (User user) {
		return tpl.insert("userMapper.insert",user);
	}
	
	public int update (User user) {
		return tpl.update("userMapper.update",user);
	}
	
	public int delete(String username) {
		return tpl.delete("userMapper.delete",username);
	}
	
	public int insertpoint(Point point) {
		return tpl.insert("userMapper.insertpoint",point);
	}
	
	public List<Point> findAllByPoint(String username) {
		return tpl.selectList("userMapper.findAllByPoint",username); 
	}
	
	public List<Point> findByPoint() {
		return tpl.selectList("userMapper.findByPoint");
	}
	
	public int deletePoint(String username) {
		return tpl.delete("userMapper.deletePoint",username);
	}
	
	public String findJoinCheckCode(String checkCode) {
		return tpl.selectOne("userMapper.findJoinCheckCode",checkCode);
	}
	
	public List<Favorite> findAllFavorite(String username)	{
		return tpl.selectList("userMapper.findAllFavorite",username);
	}
	
	//유저네임으로 페이보릿 개수 세기
	public String Favoritecount(String username) {
		return tpl.selectOne("userMapper.count",username);
	}
	
	public int insertFavorite(Favorite favorite) {
		return tpl.insert("userMapper.insertFavorite",favorite);
	}
	
	public int deleteFavorite(int favno) {
		return tpl.delete("userMapper.deleteFavorite",favno);
	}
	
	//페이보릿 찾기
	public Favorite findByFavoriteId(int favno) {
			return tpl.selectOne("userMapper.findByFavoriteId",favno);
	}
	
	//유저네임으로 페이보릿찾기
	public Favorite findByusernameFavoriteId(String username) {
			return tpl.selectOne("userMapper.findByusernameFavoriteId",username);
	}
	
//	artno로 상품 찾아오기	
	public Favorite findByArtnoFavoriteId(int artno, String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("artno", artno);
		map.put("username", username);
		return tpl.selectOne("userMapper.findByArtnoFavoriteId", map);
	}
	
//	즐겨찾기 여부 체크
	public Boolean existsByFavorite(Integer artno, String username) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("artno", artno);
		map.put("username", username);
		return tpl.selectOne("userMapper.existsByFavorite", map);
	}
	
	//유저 리뷰함
	public List<Review> listByReviewUser(String username){
			return tpl.selectList("userMapper.listByReviewUser",username);
	}
	
	//유저 리뷰삭제
	public int reviewDelete(int rno) {
		return tpl.delete("userMapper.reviewDelete",rno);
	}
	
	// 유저 모든 이름 찾기
	public List<String> findAllIrum() {
		return tpl.selectList("userMapper.findAllIrum");
	}
	//포인트 더한값
	public Integer TotalPoint(String username) {
		return tpl.selectOne("userMapper.TotalPoint",username);
	}
//리뷰 유저네임으로 총개수
	public String ReviewcountUsername(String username) {
		return tpl.selectOne("userMapper.countUsername",username);
	}
//비밀번호로 유저네임찾기
	public String passwordFindUsername(String username) {
		return tpl.selectOne("userMapper.passwordFindUsername",username);
	}
//유저네임으로 DetailorderNo
	public List<Order> OrdernoFindByUsername(String username) {
		return tpl.selectList("userMapper.OrdernoFindByUsername",username);
	}
	
//작가 사용
//유저네임으로 이름찾기
	public String irumByUsername(String username) {
		return tpl.selectOne("userMapper.irumByUsername", username);
	}
}
