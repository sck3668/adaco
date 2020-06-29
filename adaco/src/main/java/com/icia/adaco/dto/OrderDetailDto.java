package com.icia.adaco.dto;

import lombok.*;

public class OrderDetailDto {

	private OrderDetailDto() {}
		
	
	// 결제 취소
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public  static class DtoForDeleteOrderDetail{
		private Integer orderno;
		private String artistno;
		private String optionNalme;
		private Integer amouunt;
		private Integer price;
		private String address;
		private String recipient;
		private String tel;
		private String request;
		private Integer addPoint;
		private String postalcode;
		private String refundAccount;
		private boolean isShipping;
		
	}
	
	// 결제 페이지
	public static class DtoForOrdering{
	}
}
