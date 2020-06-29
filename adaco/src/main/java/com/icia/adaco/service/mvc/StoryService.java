package com.icia.adaco.service.mvc;

import java.security.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;

@Service
public class StoryService {
	@Autowired
	private StoryDao storyDao;
	@Autowired
	private ModelMapper modelMapper;
	public void storyWriter(StoryBoardDto.DtoForWrite dtoWrite,Principal principal) {
		Story story = modelMapper.map(dtoWrite, Story.class);
		storyDao.insert(story);
		
		if(story.getWriter().equals(principal.getName())==false) {
			
		}
	}

}
