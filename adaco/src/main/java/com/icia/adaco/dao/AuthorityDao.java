package com.icia.adaco.dao;

import org.apache.ibatis.annotations.*;

public interface AuthorityDao {

	@Insert("insert into authorities values(#{username}, #{authority})")
	void insert(@Param("username")String username, @Param("authority")String authority);
	
	@Update("update authorities set authority = #{authority} where username = #{username}")
	void update(@Param("username")String username, @Param("authority")String authority);

	@Select("select authority from authorities where username=#{username}")
	public String findByUsername(@Param("username") String username);
	
}
