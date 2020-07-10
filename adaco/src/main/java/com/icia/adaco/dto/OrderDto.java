package com.icia.adaco.dto;

import java.time.*;

import com.icia.adaco.entity.*;

import lombok.*;
import lombok.experimental.*;

public class OrderDto {
   private OrderDto() {
   }
   
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