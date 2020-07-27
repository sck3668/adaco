package com.icia.adaco.service.mvc;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.io.*;
import java.time.*;
import java.time.format.*;
import java.time.temporal.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.lang.*;
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
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private ArtDao artDao;
	@Value("d:/upload/story")
	private String storyFolder;
	@Value("http://localhost:8081/story/")
	private String storyPath;
	
	@Autowired
	private UserDao userDao;
	
	public Page storyList(int pageno,@Nullable Integer artistno) {
		int countOfBoard = storyDao.count();
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = 1;
		int ern = page.getEndRowNum();
		List<Story> storyList = storyDao.findAllStory(srn, ern,artistno);
//		List<Story> storyList = null;
//		storyList = storyDao.findAllStory(srn, ern);
		List<StoryBoardDto.DtoForList> storydtoList = new ArrayList<StoryBoardDto.DtoForList>();
		for (Story story : storyList) {
			StoryBoardDto.DtoForList listDto = modelMapper.map(story, StoryBoardDto.DtoForList.class);
			LocalDateTime writeDate = story.getWriteDate();
			LocalDateTime today = LocalDateTime.now();
			long isCheck = ChronoUnit.MINUTES.between(writeDate, today);
			if(isCheck >= 1440) {
				long times = ChronoUnit.DAYS.between(writeDate, today);
				listDto.setTimes(times+" 일 전");
			}
			else if(isCheck >= 60) {
				long times = ChronoUnit.HOURS.between(writeDate, today);
				listDto.setTimes(times+" 시간 전");
			} else {
				long times = ChronoUnit.MINUTES.between(writeDate, today);
				listDto.setTimes(times+" 분 전");
			}
			User user = userDao.findByid(story.getWriter());
			listDto.setProfile(user.getProfile());
			listDto.setWriteDateStr(story.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
			if(artistno!=null) {
				listDto.setArtistno(artistno);
			} else {
				listDto.setArtistno(0);
			}
			storydtoList.add(listDto);
		}
		page.setStoryList(storydtoList);
		if(artistno!=null) {
			page.setArtistno(artistno);
		} else {
			page.setArtistno(0);
		}
		System.out.println("page===="+page);
		return page;
	}
	
	public int storyWrite(StoryBoardDto.DtoForWrite dtoWrite,MultipartFile sajin,String username)throws IOException {
		Story story = modelMapper.map(dtoWrite, Story.class);
		if (sajin != null && sajin.isEmpty() == false) {
			if (sajin.getContentType().toLowerCase().startsWith("image/")==true) {
				long time = System.currentTimeMillis();
				int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf(".");
				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot + 1);
				
				File storyFile = new File(storyFolder, time + "." + extension);
				sajin.transferTo(storyFile);
				story.setImage(storyPath + storyFile.getName());
			}
		}
		story.setWriteDate(LocalDateTime.now());
		int artistno = artistDao.findArtistnoByUsername(dtoWrite.getWriter());
		System.out.println("artistno==="+artistno);
		story.setArtistno(artistno);
		storyDao.insert(story);
		return story.getStoryno();
	}

	public StoryBoardDto.DtoForRead storyRead(int storyno) {
		Story story = storyDao.findByStory(storyno);
		if(story==null)
			throw new JobFailException("보드가없다");
		StoryBoardDto.DtoForRead readDto = modelMapper.map(story,StoryBoardDto.DtoForRead.class);
		String str = story.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
		readDto.setWriteDateStr(str);
		if(story.getCommentCnt()>0) {
			List<StoryComment> commentList = storyCommentDao.findAllByStoryno(storyno);
			List<StoryCommentDto.DtoForList> dtoList = new ArrayList<StoryCommentDto.DtoForList>();
			for(StoryComment storyComment:commentList) {
				StoryCommentDto.DtoForList dto = modelMapper.map(storyComment,StoryCommentDto.DtoForList.class);
				dto.setWriteDateStr(storyComment.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
				dto.setCno(storyComment.getCno());
				dtoList.add(dto);
			}
			readDto.setComments(dtoList);
		}
		return readDto;
	}
}
