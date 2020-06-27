package com.icia.adaco.dto;

import javax.validation.constraints.*;

import lombok.*;
import lombok.experimental.*;

public class StoryBoardDto {
	private StoryBoardDto() {}
	
	@Data
	@Accessors(chain=true)
	public static class DtoForWrite {
		@Pattern(regexp="^[\\w\\s가-힣!]{1,50}$", message ="제목은 영숫자와 한글, 특수문자 !만 사용할 수 있습니다")
		private String title;
		private String content;
		private String writer;
		private String 
	}
}
