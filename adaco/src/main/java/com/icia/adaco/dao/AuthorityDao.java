package com.icia.adaco.dao;

import org.apache.ibatis.annotations.*;

public interface AuthorityDao {

	@Insert("insert into authorities values(#{uesrname}, #{authority})")
	void insert(@Param("username")String username, @Param("authority")String authority);
	
	@Update("update authorities set ")
	void update(@Param("username")String username, @Param("authority")String authority);
}
