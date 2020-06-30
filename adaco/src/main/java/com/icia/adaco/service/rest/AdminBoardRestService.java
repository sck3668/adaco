package com.icia.adaco.service.rest;

import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.icia.adaco.dao.AdminBoardDao;
import com.icia.adaco.entity.FAQ;
import com.icia.adaco.entity.Notice;
import com.icia.adaco.exception.JobFailException;

@Service
public class AdminBoardRestService {
	@Autowired
	AdminBoardDao adminBoardDao;
	
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
			File file = new File(imageFolder, fileName);
			if(file.exists()==true)
				file.delete();
		}
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

}
