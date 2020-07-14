
package com.icia.adaco.service.rest;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.*;

import java.io.*;
import java.security.*;
import java.time.*;
import java.time.format.*;
import java.util.*;

import org.jsoup.*;
import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.util.*;
import org.springframework.web.multipart.*;

import com.fasterxml.jackson.databind.*;
import com.icia.adaco.dao.*;
import com.icia.adaco.dto.*;
import com.icia.adaco.dto.StoryCommentDto.*;
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
	
// 스토리 댓글 입력
	public List<StoryComment> commentWrite(StoryComment storyComment,String username) {
		 System.out.println("진입테스트");
		 storyComment.setWriteDate(LocalDateTime.now());
		 String content = storyComment.getContent().replaceAll("\n", " ");
		 storyComment.setContent(content);
		 System.out.println(storyComment);
		 storyCommentDao.insertByCommentOfStory(storyComment);
		 storyDao.update(Story.builder().storyno(storyComment.getStoryno()).commentCnt(1).build());
		 return storyCommentDao.findAllByStoryno(storyComment.getStoryno());
	}
	
	// 스토리 읽기 할 시 댓글 읽어오기
	public List<StoryCommentDto.DtoForList> readComment(int storyno,String username) {
		System.out.println("restService storyno===="+storyno);
		List<StoryComment> commentList = storyCommentDao.findAllByStoryno(storyno);
		List<StoryCommentDto.DtoForList> dtoList = new ArrayList<StoryCommentDto.DtoForList>();
		for(StoryComment storyComment:commentList) {
			StoryCommentDto.DtoForList dto = modelMapper.map(storyComment,StoryCommentDto.DtoForList.class);
			dto.setWriteDateStr(storyComment.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dto.setCno(storyComment.getCno());
			dtoList.add(dto);
		}
		return dtoList;
	}
	
	//댓글 삭제
	public List<StoryCommentDto.DtoForList> deleteComment(int storyno, int cno, String writer) {
		StoryComment storyComment1 = storyCommentDao.findByCno(cno);
		if(writer.equals(storyComment1.getWriter())==false)
			throw new JobFailException("댓글을 삭제할 수 없습니다");
		storyCommentDao.deleteByCommentOfStory(cno);
		
		List<StoryComment> commentList = storyCommentDao.findAllByStoryno(storyno);
		List<StoryCommentDto.DtoForList> dtoList = new ArrayList<StoryCommentDto.DtoForList>();
		for(StoryComment storyComment:commentList) {
			StoryCommentDto.DtoForList dto = modelMapper.map(storyComment,StoryCommentDto.DtoForList.class);
			dto.setWriteDateStr(storyComment.getWriteDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일")));
			dto.setCno(storyComment.getCno());
			dtoList.add(dto);
		}
		return dtoList;
		//return storyCommentDao.findAllByStoryno(storyno);
	}
	
}
