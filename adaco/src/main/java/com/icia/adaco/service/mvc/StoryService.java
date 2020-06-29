package com.icia.adaco.service.mvc;

import java.security.*;
import java.time.format.*;
import java.util.*;

import org.apache.ibatis.javassist.expr.*;
import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.util.*;

@Service
public class StoryService {
	@Autowired
	private StoryDao storyDao;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private AttachmentDao attachmentDao;
	@Value("${attachmentFolder}")
	private String attachmentFolder;
	@Value("${attachmentPath}")
	private String attachmentPath;

	public int storyWriter(StoryBoardDto.DtoForWrite dtoWrite, Principal principal) {
		Story story = modelMapper.map(dtoWrite, Story.class);
		if (story.getWriter().equals(principal.getName()) == false)
			throw new JobFailException("아이디가 다르다 슈발로마");
		else
			storyDao.insert(story);

		List<MultipartFile> attachments = dtoWrite.getAttachment();
		if (attachments != null) {
			for (MultipartFile mf : attachments) {
				Attachment attachment = new Attachment();
				String originalFileName = mf.getOriginalFilename();
				long time = System.nanoTime();
				String saveFileName = time + "-" + originalFileName;
				boolean isImage = mf.getContentType().toLowerCase().startsWith("image/");
				attachmentDao.insert(attachment);
			}
		}
		return story.getStoryno();
	}

	public Page storyList(int pageno) {
		int countOfBoard = storyDao.count();
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartPage();
		int ern = page.getEndPage();
		List<Story>storyList = null;
		storyList = storyDao.findAllStory(srn,ern);
		List<StoryBoardDto.DtoForList> dtoList = new ArrayList<StoryBoardDto.DtoForList>();
		for(Story story:storyList) {
			StoryBoardDto.DtoForList listDto = modelMapper.map(story,StoryBoardDto.class);
			listDto.setWriteDateStr(story.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
		}
	}
}
