package com.icia.adaco.service.rest;

import java.security.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;

@Service
public class StoryRestService {
	@Autowired
	private StoryDao storyDao;
	@Autowired
	private ModelMapper modelMapper;
	
	public void updateStory(StoryBoardDto.DtoforUpdate updateDto,Principal principal) {
		Story story = storyDao.findByStory(updateDto.getStoryno());
		if(story==null)
			throw new JobFailException("보드가없다");
		if(story.getWriter().equals(principal.getName())==false)
			throw new JobFailException("아이디가틀려");
		story=modelMapper.map(updateDto,Story.class);
		storyDao.update(story);
	}
	public void deleteStory(Principal principal,Integer storyno) {
		Story story = storyDao.findByStory(storyno);
		if(story==null)
			throw new JobFailException("보드가없다");
		if(story.getWriter().equals(principal.getName())==true)
			storyDao.delete(storyno);
	}
}
