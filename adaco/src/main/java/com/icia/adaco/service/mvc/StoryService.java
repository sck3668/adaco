package com.icia.adaco.service.mvc;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.io.*;
import java.time.*;
import java.time.format.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.StoryCommentDto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.util.*;
import com.nhncorp.lucy.security.xss.markup.*;

@Service
public class StoryService {
	@Autowired
	private StoryDao storyDao;
	@Autowired
	private StoryCommentDao storyCommentDao;
	@Autowired
	private ModelMapper modelMapper;
	@Value("${profileFolder}")
	private String profileFolder;
	@Value("${profilePath}")
	private String profilePath;

	public int storyWrite(StoryBoardDto.DtoForWrite dtoWrite,MultipartFile sajin)throws IOException {
		Story story = modelMapper.map(dtoWrite, Story.class);
		if (sajin != null && sajin.isEmpty() == false) {
			if (sajin.getContentType().toLowerCase().startsWith("image/")==true) {
				int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf(".");
				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot + 1);
				
				File storyFile = new File(profileFolder, story.getWriter() + "." + extension);
				sajin.transferTo(storyFile);
				story.setImage(profilePath + storyFile.getName());
			}
		}
		story.setWriteDate(LocalDateTime.now());
		storyDao.insert(story);
		return story.getStoryno();
	}

	public Page storyList(int pageno) {
		int countOfBoard = storyDao.count();
		Page page = PagingUtil.storyPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Story> storyList = null;
		storyList = storyDao.findAllStory(srn, ern);
		List<StoryBoardDto.DtoForList> storydtoList = new ArrayList<StoryBoardDto.DtoForList>();
		for (Story story : storyList) {
			StoryBoardDto.DtoForList listDto = modelMapper.map(story, StoryBoardDto.DtoForList.class);
			listDto.setWriteDateStr(story.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
			storydtoList.add(listDto);
		}
		page.setStoryList(storydtoList);
		return page;
	}
	public StoryBoardDto.DtoForRead storyRead(int storyno) {
		Story story = storyDao.findByStory(storyno);
		if(story==null)
			throw new JobFailException("보드가없다");
		StoryBoardDto.DtoForRead readDto = modelMapper.map(story,StoryBoardDto.DtoForRead.class);
		String str = story.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
		readDto.setWriteDateStr(str);
		if(story.getCommentCnt()>0)
			readDto.setComments(storyCommentDao.findAllByStoryno(readDto.getStoryno()));
		return readDto;
	}
}
