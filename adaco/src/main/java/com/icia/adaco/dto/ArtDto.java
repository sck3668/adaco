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
		private int optno;
		private String optionName;
		private String optionValue;
		private Integer optionStock;
		private Integer optionPrice;
		
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	@Accessors(chain=true)
	// 작품 리스트 (작가용)
	public static class DtoForList{
		private Integer artno;
		private String category;
		private String mainImg;
		private String artName;
		private Integer price;
	}
<<<<<<< HEAD
}
=======
	
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
		private int optno;
		private String optionName;
		private String optionValue;
		private Integer optionStock;
		private Integer optionPrice;
		private boolean favorite;
		private Integer readCnt;
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
		private boolean favorite;
		private String category;
		private Integer artistno;
		private Integer shopno;
		private int optno;
		private String optionName;
		private String optionValue;
		private Integer optionStock;
		private Integer optionPrice;
		
	}

}
>>>>>>> branch 'master' of https://github.com/sck3668/adaco.git
