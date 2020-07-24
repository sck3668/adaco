package com.icia.adaco.dto;

import com.icia.adaco.entity.*;

import lombok.*;
import lombok.experimental.*;
 

public class ReviewDto {
	private ReviewDto() {}
	
	@Data
	@Builder
	@AllArgsConstructor
	@NoArgsConstructor
	@Accessors(chain = true)
	public static class DtoForList {
		private int artno;
		private star star;
		private String username;
		private String writeDateStr;
		private String content;
		private String image;
		private int rno;
	}
}
