package com.icia.adaco.dto;

import java.time.*;

import javax.validation.constraints.*;

import lombok.*;
import lombok.experimental.*;

public class StoryCommentDto {
	private StoryCommentDto() {}

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
		private String profile;
		private int cno;
	}
}
