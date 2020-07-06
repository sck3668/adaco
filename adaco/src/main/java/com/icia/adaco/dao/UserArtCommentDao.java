package com.icia.adaco.dao;

import org.apache.ibatis.annotations.*;

public interface UserArtCommentDao {
	// cno로 username	찾기
	@Select("select username from users_art_comment where username=#{username} and cno=#{cno} and rownum=1")
	public String findUsernameByCno(@Param("username") String username, @Param("cno") int cno);
	
	//추가
	@Insert("insert into users_art_comment values(#{username},#{cno})")
	public int insert(@Param("username") String username, @Param("cno") int cno);
}
