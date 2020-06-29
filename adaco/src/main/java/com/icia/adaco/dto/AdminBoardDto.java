package com.icia.adaco.dto;

import lombok.*;

public class AdminBoardDto {
	private AdminBoardDto() {}

	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForReportList{
		private int cno;
		private String username;
		private String content;
		private String writeDateStr;
		private int reportCnt;
	}

	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForQuestionList{
		private int qno;
		private String wirter;
		private String title;
		private String writeDateStr;
		private String state;
	}
}
