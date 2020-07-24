package com.icia.adaco.dto;

import lombok.*;
import lombok.experimental.*;

public class ArtCommentDto {
	private ArtCommentDto() {}
	
	@Data
	@Builder
	@AllArgsConstructor
	@NoArgsConstructor
	@Accessors(chain = true)
	public static class DtoForList {
		private int artno;
		private String username;
		private String writeDateStr;
		private String content;
		private String profile;
		private int cno;
	}
}
