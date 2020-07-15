package com.icia.adaco.dto;

import java.time.*;

import com.icia.adaco.entity.*;

import lombok.*;
import lombok.experimental.*;

public class OrderDto {
	  private OrderDto() {
	   }

 //결제하기 화면 이동시 넘겨줄 값
 	@Data
 	@AllArgsConstructor
 	@NoArgsConstructor
 	@Builder
 	@Accessors(chain=true)
 	public static class DtoForPayment{
 		//Art
// 		private String artName;
// 		private int price;
// 		private String artistName;
// 		private int amount;
// 		private int totalPrice;
// 		private String optionName;
// 		private String optionValue;
// 		private Integer optionStock;
// 		private Integer optionPrice;
// 		private int couriPrice;
// 		private int accumulated;
// 		//User
// 		private String username;
// 		private int tel;
// 		private String irum;
// 		private String email;
 		private Art art;
 		private Option option;
 		private User user;
 		private Bag bag;
 		private String artistName;
 		// 외래키
 		private int artistno;
 		private int optno;
 		private int orderno;
 	}
 	//////////////////////////
   
   @Data
   @AllArgsConstructor
   @NoArgsConstructor
   @Builder
   @Accessors(chain=true)
   private static class DtoForWrite{
      private int orderno;
      private LocalDateTime orderDate;
      private String username;
      private int shippingCharge;
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
		private Option Option;
	}
}