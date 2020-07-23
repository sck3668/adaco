package com.icia.adaco.util;

import com.icia.adaco.dto.*;

public class PagingUtil {
	// 페이지당 글의 개수
	private final static int COUNT_OF_BOARD_PER_PAGE = 10;
	// 블록당 페이지의 개수
	private final static int COUNT_OF_PAGE_PER_BLOCK = 5;
	
	// 일반글 페이징 또는 히트글 페이징
	public static Page getPage(int pageno, int countOfBoard) {
		System.out.println(countOfBoard);
		// 페이지의 개수 계산
		// 마지막 페이지가 페이지의 개수보다 클 수 없다
		int countOfPage = countOfBoard/COUNT_OF_BOARD_PER_PAGE + 1;
		if(countOfBoard%COUNT_OF_BOARD_PER_PAGE == 0)
			countOfPage--;
		if(pageno>countOfPage)
			pageno=countOfPage;
		
		int startRowNum = (pageno-1)*COUNT_OF_BOARD_PER_PAGE +1;
		int endRowNum = startRowNum + COUNT_OF_BOARD_PER_PAGE - 1;
		
		// endRowNum은 글의 개수이하
		endRowNum = (endRowNum>countOfBoard)?countOfBoard:endRowNum;
		
		// block  번호
		// 1~5페이지			블록번호 0
		// 6~10페이지			블록번호 1
		// 11~15페이지		블록번호 2
		System.out.println(startRowNum);
		System.out.println(endRowNum);
		
		
		int blockNo = (pageno-1)/COUNT_OF_PAGE_PER_BLOCK;
		int startPage = blockNo * COUNT_OF_PAGE_PER_BLOCK + 1;
		int endPage = startPage + COUNT_OF_PAGE_PER_BLOCK - 1;
		
		endPage = (endPage>countOfPage)?countOfPage:endPage;
	
		boolean isPrev = blockNo>0? true : false;
		boolean isNext = endPage != countOfPage? true: false; 
		
		return Page.builder().startPage(startPage).endPage(endPage)
			.startRowNum(startRowNum).endRowNum(endRowNum)
			.isPrev(isPrev).isNext(isNext).pageno(pageno).build();
		
	}
	
	// 스토리 목록 페이징
	public static Page getPage2(int pageno, int countOfBoard) {
		int COUNT_OF_BOARD_PER_PAGE = 9;
		// 블록당 페이지의 개수
		int COUNT_OF_PAGE_PER_BLOCK = 5;
		
		System.out.println(countOfBoard);
		// 페이지의 개수 계산
		// 마지막 페이지가 페이지의 개수보다 클 수 없다
		int countOfPage = countOfBoard/COUNT_OF_BOARD_PER_PAGE + 1;
		if(countOfBoard%COUNT_OF_BOARD_PER_PAGE == 0)
			countOfPage--;
		if(pageno>countOfPage)
			pageno=countOfPage;
		
		int startRowNum = (pageno-1)*COUNT_OF_BOARD_PER_PAGE +1;
		int endRowNum = startRowNum + COUNT_OF_BOARD_PER_PAGE - 1;
		
		// endRowNum은 글의 개수이하
		endRowNum = (endRowNum>countOfBoard)?countOfBoard:endRowNum;
		
		// block  번호
		// 1~5페이지			블록번호 0
		// 6~10페이지			블록번호 1
		// 11~15페이지		블록번호 2
		System.out.println(startRowNum);
		System.out.println(endRowNum);
		
		
		int blockNo = (pageno-1)/COUNT_OF_PAGE_PER_BLOCK;
		int startPage = blockNo * COUNT_OF_PAGE_PER_BLOCK + 1;
		int endPage = startPage + COUNT_OF_PAGE_PER_BLOCK - 1;
		
		endPage = (endPage>countOfPage)?countOfPage:endPage;
		
		boolean isPrev = blockNo>0? true : false;
		boolean isNext = endPage != countOfPage? true: false; 
		
		return Page.builder().startPage(startPage).endPage(endPage)
			.startRowNum(startRowNum).endRowNum(endRowNum)
			.isPrev(isPrev).isNext(isNext).pageno(pageno).build();
	}
}
