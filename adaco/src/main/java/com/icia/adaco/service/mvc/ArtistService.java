package com.icia.adaco.service.mvc;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.adaco.dao.*;
import com.icia.adaco.entity.*;

@Service
public class ArtistService {
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	private StoryDao storyDao;
	@Autowired
	private 
	
	public void writeStory(Artist artist,Principal principal) {
		storyDao.findByStory(storyno);
		if(artist.getUsername()==principal.getName()) {
		storyDao.insert(story);
		}
	}
}
