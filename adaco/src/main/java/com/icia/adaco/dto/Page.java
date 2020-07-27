package com.icia.adaco.dto;

import java.util.*;

import com.icia.adaco.entity.*;

import lombok.*;

@Data
@Builder
public class Page {
	// 아래 두 필드는 페이지네이션과 상관없다
	private int startRowNum;
	private int endRowNum;
	
	private int pageno;
	private int startPage;
	private int endPage;
	private boolean isPrev;
	private boolean isNext;
	private State state;
	private String search;
	private Integer artistno;
	private String category;
	List<AdminBoardDto.DtoForReportList> adminReportList;
	List<AdminBoardDto.DtoForQuestionList> adminQuestionList;
	List<AdminBoardDto.DtoForNoticeList> adminNoticeList;
	List<AdminUserDto.DtoForUserList> adminUserList;
	List<AdminUserDto.DtoForArtistList> adminArtist;
	List<ArtDto.DtoForList> artList;
	List<ArtDto.DtoForReviewList> artReviewList;
	List<StoryBoardDto.DtoForList> storyList;
	List<StoryCommentDto.DtoForList> storyCommentList;
	List<OrderDto.DtoForList> orderList;
}
