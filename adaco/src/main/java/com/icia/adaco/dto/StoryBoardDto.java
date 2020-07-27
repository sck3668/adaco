package com.icia.adaco.dto;

import java.time.*;
import java.util.*;

import javax.validation.constraints.*;

import org.springframework.web.multipart.*;

import com.icia.adaco.entity.*;
import com.nhncorp.lucy.security.xss.markup.*;

import lombok.*;
import lombok.experimental.*;

public class StoryBoardDto {
	private StoryBoardDto() {
	}

	@Data
	@Accessors(chain = true)
	public static class DtoForWrite {
		private Integer storyno;
		private String title;
		private String content;
		private String writer;
		private String writeDateStr;
		private List<MultipartFile> attachments;
		private String image;
		private Integer cno;
	}

	@Data
	@Accessors(chain = true)
	public static class DtoForRead {
		private int storyno;
		private String title;
		private String content;
		private String writer;
		private String writeDateStr;
		private List<StoryCommentDto.DtoForList> comments;
	}

	@Data
	@Builder
	@AllArgsConstructor
	@NoArgsConstructor
	@Accessors(chain = true)
	public static class DtoForList {
		private int storyno;
		private String title;
		private String writer;
		private String writeDateStr;
		private String image;
		private String content;
		private String profile;
		private String times;
		private Integer artistno;
	}

	@Data
	@Builder
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoforUpdate {
		@NotNull
		private int storyno;
		@Pattern(regexp = "^[\\w\\s가-힣!]{1,50}$", message = "제목은 영숫자와 한글, 특수문자 !만 사용할 수 있습니다")
		private String title;
		private String image;
		private String content;
		private String writer;
	}
}
