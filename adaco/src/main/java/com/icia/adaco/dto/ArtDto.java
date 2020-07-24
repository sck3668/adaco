package com.icia.adaco.dto;
import java.time.*;
import java.util.*;

import javax.validation.constraints.*;

import com.icia.adaco.entity.*;

import lombok.*;
import lombok.experimental.*;

public class ArtDto {
	
	private ArtDto() {}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	@Accessors(chain=true)
	// 작품 등록
	public static class DtoForWrite{
		private int artno;
		private String artName;
		private Integer price;
		private Integer stock;
		private String tag;
		private LocalDateTime artDate;
		private Integer couriPrice;
		private String returnAddress;
		private String courier;
		private String category;
		private Integer artistno;
		private Integer shopno;
		private String username;
		private int optno;
		private String optionName;
		private String optionValue;
		private Integer optionStock;
		private Integer optionPrice;
		private String artDetail;
		private Double accumulated;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	@Accessors(chain=true)
	// 작품 리스트 (작가용/회원용)
	public static class DtoForList{
		private Integer artno;
		private String category;
		private String mainImg;
		private String artName;
		private Integer price;
		private Integer favoriteCnt;
		private Boolean isFavorite;
		private LocalDate artDate;
		private String username;
		private String tag;
		private Integer artistno;
		List<Art> artList;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	@Accessors(chain=true)
	// 작품 업데이트
	public static class DtoForUpdate{
		@NotNull
		private Integer artno;
		private String artName;
		private Integer price;
		private String mainImg;
		private String artImg;
		private Integer stock;
		private String tag;
		private Integer couriPrice;
		private String courier;
		private Integer artistNo;
		private String username;
		private int optno;
		private String optionName;
		private String optionValue;
		private Integer optionStock;
		private Integer optionPrice;
		private Integer favoriteCnt;
		private Boolean isFavorite;
		private Integer readCnt;
		private String artDetail;
		private Integer reviewCnt;
		private Integer shopno;
	}
	
	@Data
	@Accessors(chain=true)
	// 작품 상세 보기 (작가용/회원용)
	public static class DtoForRead{
		private Integer artno;
		private String artName;
		private Integer price;
		private String mainImg;
		private String artImg;
		private Integer stock;
		private String tag;
		private String artDate;
		private Integer couriPrice;
		private String returnAddress;
		private String courier;
		private Integer accumulated;
		private Integer favoriteCnt;
		private Boolean isFavorite;
		private String category;
		private Integer readCnt; 
		private Integer artistno;
		private String shopName;
		private String username;
		private int optno;
		private String optionName;
		private String optionValue;
		private Integer optionStock;
		private Integer optionPrice;
		private List<ArtCommentDto.DtoForList> artComments;
		private List<ReviewDto.DtoForList> reviews;
		private String artDetail;
		private Integer artCommentCnt;
		private Integer shopno;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	@Accessors(chain=true)
	// 작품 리뷰 리스트 (회원용)
	public static class DtoForReviewList{
		private Integer rno;
		private star star;
		private String content;
		private String image;
		private String writeDateStr;
		private String username;
		private Integer favoriteCnt;
		private Boolean isFavorite;
		private String artfile;
	}
	 
	public static class DtoForBag{
		private String artName;
		private Integer price;
		private String mainImg;
		private Integer stock;
	}
	
	public static class DtoForOrder{
		private Integer artno;
		private String artName;
		private Integer price;
		private String mainImg;
		private Integer stock;
		private Integer couriPrice;
	}
	// 작품 등록시 유저네임으로 작가번호, 상점번호 받아오기
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForArtistnoAndShopno{
		private Integer shopno;
		private Integer artistno;
	}
}