package com.icia.adaco.dto;

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
		
	}
	@Data
	@Builder
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoForUpdate {
		private Integer shopno;
		private String shopName;
		private String shopIntro;
		private String image;
		private String businessno;
		private String account;
		private String forwarding;
		private String back;
	}
}
