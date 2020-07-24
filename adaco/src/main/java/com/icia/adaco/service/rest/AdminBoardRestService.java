package com.icia.adaco.service.rest;

import java.io.*;
import java.util.*;
import java.util.regex.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;

@Service
public class AdminBoardRestService {
	@Autowired
	AdminBoardDao adminBoardDao;
	@Autowired
	ObjectMapper objectMapper;
	@Autowired
	AttachmentDao attachmentDao;
	@Value("http://localhost:8081/ckimage/")
	private String ckUrl;
	@Value("${imageFolder}")
	private String imageFolder;
	
	Pattern ckImagePattern = Pattern.compile("src=\".+\"\\s");
	
	public void deleteArt(Integer artno) {
		/* 추가되면 할 것
		List<Attachment> list = attachmentDao.findAllByBno(bno);
		for(Attachment a :list) {
			File file = new File("d:/upload/attahment", a.getSaveFileName());
			if(file.exists()==true)
				file.delete();
		} 
		attachmentDao.deleteAllByArtno(artno);
		*/
		adminBoardDao.deleteByArt(artno);
	}
	
	public void deleteNoitce(Integer noticeno) {
		Notice notice = adminBoardDao.findNoticeById(noticeno);
		if (notice == null)
			throw new JobFailException("공지사항을 찾을 수 없습니다.");
		String content = notice.getContent();
		Matcher matcher = ckImagePattern.matcher(content);
		while(matcher.find()) {
			String src = matcher.group();
			int start = src.indexOf("ckimage/");
			int end = src.indexOf("style=");
			String fileName = src.substring(start+8, end-2);
			File file = new File("d:/upload/ckimage", fileName);
			if(file.exists()==true)
				file.delete();
		}
		List<Attachment> list = attachmentDao.findAllNoticeByNoticeno(noticeno);
		for(Attachment a : list) {
			File file = new File("d:/upload/attachment", a.getSaveFileName());
			if(file.exists()==true)
				file.delete();
		}
		adminBoardDao.deleteByNotice(noticeno);
		attachmentDao.deleteAllNoticeByNoticeno(noticeno);
	}

	public int updateFaq(FAQ faq) {
		return adminBoardDao.updateByFAQ(faq);
	}

	public int deleteFaq(Integer faqno) {
		FAQ faq = adminBoardDao.findFAQById(faqno);
		if(faq == null)
			throw new JobFailException("해당 글을 찾을 수 없습니다.");
		return adminBoardDao.deleteByFAQ(faqno);
	}

	public Object saveCkImage(MultipartFile upload) {
		Map<String, String> map = new HashMap<String, String>();
		if(upload != null) {
			if(upload.getContentType().toLowerCase().startsWith("image/")) {
				String imageName = UUID.randomUUID().toString()+".jpg";
				try {
					File file = new File("d:/upload/ckimage", imageName);
				upload.transferTo(file);
				map.put("uploaded", "1");
				map.put("fileName", imageName);
				map.put("url", ckUrl + imageName);
				return objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public Attachment readAttachment(Integer ano) {
		return attachmentDao.findById(ano);
	}

	public List<Attachment> deleteAttachment(Integer ano, Integer noticeno) {
		Attachment attachment = attachmentDao.findById(ano);
		if(attachment != null) {
			File file = new File("d:/upload/attachment", attachment.getSaveFileName());
			if(file.exists()==true)
				file.delete();
			attachmentDao.deleteById(ano);
		}
		return attachmentDao.findAllNoticeByNoticeno(noticeno);
	}

	public void writeCategory(Category category) {
		adminBoardDao.insertByCategory(category);
	}

	public void deleteCategory(String category) {
		adminBoardDao.deleteByCategory(category);
	}
}
 