package com.icia.adaco.dto;

import java.time.*;

import javax.validation.constraints.*;

import lombok.*;
import lombok.experimental.*;

public class StoryCommentDto {
	private StoryCommentDto() {}

	@Data
	@Accessors(chain = true)
	public static class DtoForWrite {
		private Integer storyno;
		private String content;
		private String writer;
		private String writeDateStr;
		private Integer cno;
	}

	
	@Data
	@Builder
	@AllArgsConstructor
	@NoArgsConstructor
	@Accessors(chain = true)
	public static class DtoForList {
		private int storyno;
		private String writer;
		private String writeDateStr;
		private String content;
		private int cno;
	}

	@Data
	@Builder
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoforUpdate {
		@NotNull
		private int storyno;
		private String content;
		private String writer;
	}
}
