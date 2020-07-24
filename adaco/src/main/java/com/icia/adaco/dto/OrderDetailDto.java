package com.icia.adaco.dto;


import com.icia.adaco.entity.*;

import lombok.*;
import lombok.experimental.*;

public class OrderDetailDto {
	private OrderDetailDto() {}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	@Accessors(chain=true)
	public static class DtoForReadOrder {
		private Integer orderno;
		private Integer optno;
		private Integer artno;
		private Integer artistno;
		private String artName;
		private String optionName; //옵션명
		private String optionValue; // 옵션값
		private Integer amount; 
		private Integer price;
		private String address;  // 배송지
		private String recipient; // 수령인
		private String tel;
		private String email;
		private String request;
		private Integer addPoint;
		private String postalcode;
		private String refundAccount;
		private Boolean isShipping;
		private String mainImg;
		private orderState orderstate;
		private String username;
		private String orderDateStr;
		private String irum;
		private Integer shippingCharge;
	}
	
	// 결제 취소
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Accessors(chain=true)
	@Builder
	public  static class DtoForDeleteOrder{
		private Integer orderno;
		private Integer optno;
		private Integer artno;
		private String artname;
		private String optionName; //옵션명
		private String optionValue; // 옵션값
		private Integer amount; 
		private Integer price;
		private String address;  // 배송지
		private String recipient; // 수령인
		private String tel;
		private Integer addPoint;
		private String postalcode;
		private String refundAccount;
	}
	
		// 주문 상태 업데이트
		@Data
		@AllArgsConstructor
		@NoArgsConstructor
		@Builder
		@Accessors(chain=true)
	public static class DtoForUpdate{
		private Integer orderno;
		private orderState orderstate;
		private Integer artistno;
		private String username;
	}
}
	
