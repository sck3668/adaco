package com.icia.adaco.dto;

import java.time.*;
import java.util.*;

import org.springframework.web.multipart.*;

import com.icia.adaco.entity.*;

import lombok.*;
import lombok.experimental.*;

public class AdminBoardDto {
	private AdminBoardDto() {}

	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForReportList{
		private Integer cno;
		private String username;
		private String content;
		private String writeDateStr;
		private Integer reportCnt;
	}

	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	@Accessors(chain = true)
	public static class DtoForQuestionWrite{
		private Integer qno;
		private String writer;
		private String content;
		private String title;
		private State state;
		private String writeDateStr; 
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForQuestionList{
		private Integer qno;
		private String writer;
		private String title;
		private String writeDateStr;
		private String state;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForQuestionRead{
		private Integer qno;
		private String writer;
		private String title;
		private String state;
		private String answer;
		private String content;
		private String answerContent;
		private String writeDateStr;
		private String answerDateStr;
	}
	
	@Data
	@Accessors(chain = true)
	public static class DtoForNoticeWrite {
		private Integer noticeno;
		private String title;
		private String content;
		private String writer;
		private Boolean isImportant;
		private LocalDateTime writeDate;
		private List<MultipartFile> attachments;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForNoticeList{
		private Integer noticeno;
		private String title;
		private String writeDateStr;
		private String writer;		
		private boolean isImportant;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForNoticeRead{
		private Integer noticeno;
		private String content;
		private String title;
		private String writeDateStr;
		private String writer;
		private Boolean isImportant;
		private int attachmentCnt;
		private List<Attachment> attachments;
		
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForIndex{
		private Integer countByQuestion;
		private Integer countByNoAnswerQuestion;
		private Integer countByUser;
		private Integer countByArtist;
		private Integer countByMessage;
		private Integer countByNoReadMessage;
	}
}
