package com.icia.adaco.dto;

import javax.validation.constraints.*;

import lombok.*;
import lombok.experimental.*;

public class ShopDto {
	private ShopDto() {
		
	}
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Accessors(chain=true)
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
	@Accessors(chain = true )
	public static class DtoForRead {
		private int shopno;
		private String shopName;
		private String shopIntro;
		private String image;
		
	}
	@Data
	@Builder
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoForUpdate {
		@NotNull
		private int shopno;
		private String shopName;
		private String shopIntro;
	}
}
