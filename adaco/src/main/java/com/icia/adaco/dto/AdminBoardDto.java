package com.icia.adaco.dto;

import lombok.*;

public class AdminBoardDto {
	private AdminBoardDto() {}

	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForList{
		private int cno;
		private String username;
		private String content;
		private String writeDateStr;
		private int reportCnt;
	}
}
