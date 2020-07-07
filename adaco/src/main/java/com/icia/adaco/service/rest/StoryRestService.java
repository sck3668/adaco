
package com.icia.adaco.service.rest;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.*;

import java.io.*;
import java.security.*;
import java.time.format.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.util.*;
import org.springframework.web.multipart.*;

import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.exception.*;
import com.icia.adaco.util.*;

@Service
public class StoryRestService {
	private static final List<StoryComment> StoryCommentDao = null;
	@Autowired
	private StoryDao storyDao;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private ObjectMapper objectMapper;
	@Autowired
	private StoryCommentDao storyCommentDao;
	@Value("${imageFolder}")
	private String imageFolder;
	@Value("${imagePath}")
	private String imagePath;

	public void updateStory(StoryBoardDto.DtoforUpdate updateDto, Principal principal) {
		Story story = storyDao.findByStory(updateDto.getStoryno());
		if (story == null)
			throw new JobFailException("보드가없다");
		if (story.getWriter().equals(principal.getName()) == false)
			throw new JobFailException("아이디가틀려");
		story = modelMapper.map(updateDto, Story.class);
		
		storyDao.update(story);
		
	}

	public void deleteStory(Principal principal, Integer storyno) {
		Story story = storyDao.findByStory(storyno);
		if (story == null)
			throw new JobFailException("보드가없다");
		if (story.getWriter().equals(principal.getName()) == true)
			storyDao.delete(storyno);
	}

	public String ckupload(MultipartFile upload) throws IOException {
		Map<String, Object> map = new HashMap<>();
		if (upload != null) {
			if (upload.getContentType().toLowerCase().startsWith("image/")) {
				String imageName = UUID.randomUUID().toString() + ".jpg";
				File file = new File(imageFolder, imageName);
				FileCopyUtils.copy(upload.getBytes(), file);
				String fileUrl = imagePath + imageName;
				map.put("upload", "1");
				map.put("fileName", imageName);
				map.put("url", fileUrl);
			}
			return objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
		}return null;
	}
	public Page ListComment(int pageno,StoryComment storyComment,String username) {
		int countOfBoard = storyCommentDao.count();
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<StoryComment> storyCommentList = null;
		storyCommentList = storyCommentDao.findAllByCno(srn,ern);
		List<StoryCommentDto.DtoForList> storyCommentDtoList=new ArrayList<StoryCommentDto.DtoForList>();
		
		for(StoryComment storyComment1 :storyCommentList ) {
			//스토리 커멘트 리스트 :SCList
			StoryCommentDto.DtoForList SCList = modelMapper.map(storyComment1,StoryCommentDto.DtoForList.class);
			SCList.setWriteDateStr(storyComment1.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년MM월dd일")));
			storyCommentDtoList.add(SCList);
			System.out.println(storyCommentDtoList.add(SCList)+"햐ㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑ");
			System.out.println(SCList+"포문");
		}
		page.setStoryCommentList(storyCommentDtoList);
		storyComment.setUsername(username);
		storyComment.setWriter(username);
		System.out.println(storyComment.getWriter()+"ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ");
		storyCommentDao.insertByCommentOfStory(storyComment);
		
		return page;
		
	}
}
