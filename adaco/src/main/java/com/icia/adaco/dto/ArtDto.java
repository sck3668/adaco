package com.icia.adaco.dto;

import java.time.*;

import javax.validation.constraints.*;

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
		private String mainImg;
		private String artImg;
		private String stock;
		private String tag;
		private LocalDateTime artDate;
		private Integer couriPrice;
		private String returnAddress;
		private String courier;
		private String category;
		private Integer artistno;
		private Integer shopno;
		private String username;
		
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	@Accessors(chain=true)
	// 작품 리스트
	public static class DtoForList{
		private Integer artno;
		private String category;
		private String mainImg;
		private String artName;
		private Integer price;
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
		private String couriPrice;
		private String returnAddress;
		private String courier;
		private Integer artistNo;
		private String username;
		
		
	}

}
