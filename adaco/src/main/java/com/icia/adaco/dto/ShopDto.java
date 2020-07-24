package com.icia.adaco.dto;

import java.util.*;

import javax.validation.constraints.*;

import lombok.*;

public class ShopDto {
	private ShopDto() {
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForMade {
		private Integer artistno;
		private Integer shopno;
		private String shopName;
		private String shopIntro;
		private String businessno;
		private String account;
		private String image;
		private String forwarding;
		private String back;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForRead {
		private Integer shopno;
		private String shopName;
		private String shopIntro;
		private String image;
		private String businessno;
		private String account;
		private String forwarding;
		private String back;
		private List<String> img;
		private List<Integer> artno;
		private int artistno;
	}
	
	@Data
	@Builder
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoForUpdate {
		private Integer shopno; 		
		@Pattern(regexp="^[가-힣A-Za-z0-9]{2,10}$", message="상점이름은 2~10자입니다." )
		private String shopName;
		private String shopIntro;
		private String image;
		@Pattern(regexp="^[0-9]{10}$", message="사업자번호는 숫자 10자입니다." )
		private String businessno;
		@Pattern(regexp="^[0-9]{13,16}$", message="계좌번호은 13~16자입니다." )
		private String account;
		private String forwarding;
		private String back;
	}
}
