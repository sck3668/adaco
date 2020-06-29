package com.icia.adaco.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.icia.adaco.entity.*;



public interface AttachmentDao {
	@Insert("insert into attachment values(attachment_seq.nextval, #{s.writer}, #{s.originalFileName}, #{s.saveFileName}, #{s.length}, #{s.storyno}, #{s.isImage})")
	public void insert(@Param("s") Attachment s);

	@Select("select ano, writer, bno, original_file_name originalFileName, save_file_name saveFileName, length, is_image isImage from attachment where storyno=#{story}")
	public List<Attachment> findAllByBno(int storyno);

	@Select("select ano, writer, storyno, original_file_name originalFileName, save_file_name saveFileName, length, is_image isImage from attachment where ano=#{ano} and rownum=1")
	public Attachment findById(Integer ano);

	@Delete("delete from attachment where ano=#{ano} and rownum=1")
	public void deleteById(Integer ano);

	@Delete("delete from attachment where storyno=#{storyno}")
	public void deleteAllByBno(Integer story);

}
