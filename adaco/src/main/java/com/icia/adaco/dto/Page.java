package com.icia.adaco.dto;

import java.util.*;

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
	
<<<<<<< HEAD
	List<AdminBoardDto.DtoForList> adminReportList;
	List<AdminUserDto.DtoForUserList> adminUserList;
	List<ArtDto.DtoForList> artList;
	List<AdminUserDto.DtoForArtistList> adminArtist;
=======
	List<AdminBoardDto.DtoForReportList> adminReportList;
	List<AdminBoardDto.DtoForQuestionList> adminQuestionList;
	List<AdminBoardDto.DtoForNoticeList> adminNoticeList;
	List<AdminUserDto.DtoForUserList> adminUserList;
	List<AdminUserDto.DtoForArtistList> adminArtist;

	List<ArtDto.DtoForList> artList;
>>>>>>> branch 'master' of https://github.com/sck3668/adaco.git
	List<StoryBoardDto.DtoForWrite> storyList;

}
