package com.icia.adaco.dto;


import lombok.*;
import lombok.experimental.*;

public class OrderDetailDto {

	private OrderDetailDto() {}
		
	
	// 결제 취소
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Accessors(chain=true)
	@Builder
	public  static class DtoForDeleteOrderDetail{
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
	
	// 결제 페이지
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	@Accessors(chain=true)
	public static class DtoForOrdering{
		private Integer orderno;
		private Integer optno;
		private Integer artno;
		private Integer artistno;
		private String artname;
		private String optionName;
		private String optionValue;
		private Integer amount; 
		private Integer price;
		private String address;
		private String recipient;
		private String tel;
		private String request;
		private Integer addPoint;
		private String postalcode;
		private String refundAccount;
	}
}
