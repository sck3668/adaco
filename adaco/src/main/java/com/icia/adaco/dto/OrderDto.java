package com.icia.adaco.dto;

import java.time.*;
import java.util.*;

import com.icia.adaco.entity.*;

import lombok.*;
import lombok.experimental.*;

public class OrderDto {
   private OrderDto() {
   }
   
   //결제시 넘겨줄 ordernos
 	 @Data
 	 @AllArgsConstructor
 	 @NoArgsConstructor
 	 @Builder
 	 @Accessors(chain=true)
 	 public static class DtoForOrdernos{
 		  private List<String> ordernos;
 	  }
 	 
 //결제하기 화면 이동시 넘겨줄 값
 	@Data
 	@AllArgsConstructor
 	@NoArgsConstructor
 	@Builder
 	@Accessors(chain=true)
 	public static class DtoForPayment{
 		private List<Art> artList;
 		private List<String> writerList;
 		private List<Bag> bagList;
 		private Option option;
 		private Bag bag;
 		private User user;
 		private String artistName;
 		private int price;
 		private int artistno;
 		private int optno;
 		private List<Integer> ordernoList;
 		private int lastPrice;
 		
 	}
 	
	@Data
 	@AllArgsConstructor
 	@NoArgsConstructor
 	@Builder
 	@Accessors(chain=true)
 	public static class DtoForAfter1{
 		private List<Art> artList;
 		private List<String> writerList;
 		private List<Bag> bagList;
 		private List<Order> orderList;
 		private List<OrderDetail> detailList;
 		private Option option;
 		private Bag bag;
 		private User user;
 		private String artistName;
 		private int price;
 		private int artistno;
 		private int optno;
 		private int orderno;
 		private String orderDateStr;
 		private String recipient;
 		private String address;
 		private List<String> requestList;
 	}
	
 	@Data
 	@AllArgsConstructor
 	@NoArgsConstructor
 	@Builder
 	@Accessors(chain=true)
 	public static class DtoForAfter{
 		private List<Integer> ordernos;
 		private List<Integer> optnos;
 		private List<Integer> artnos;
 		private List<Integer> artistnos;
 		private String mainImg;
 		private String artName;
 		private int amount;
 		private int price;
 		private int accumulated;	//적립금
 		private int totalPrice;
 		private String username;
 		private String account; 
 		private String recipient;
 		private String postalcode;
 		private String tel;
 		private int shippingCharge;
 		private String originalAddress;
 		private String refundAccount;
 		private List<String> request;
 		private String orderDateStr;
 		private String optionValue;
 		private String optionName;
 		private Art art;
 		private Option option;
 	}
 	////////////////////////////	총결제금액,주문번호,적립포인트,작품명,
	//	배송지,배송비,작품이미지,
   
   @Data
   @AllArgsConstructor
   @NoArgsConstructor
   @Builder
   @Accessors(chain=true)
   // 회원, 작가 함께 사용
   public static class DtoForList{
      private int orderno;
      private String orderDateStr;
      private String username;
      private int shippingCharge;
      private String artName;
      private int artPrice;
      private orderState orderstate;
      private int artistno;
      private String recipient;
      private Integer price;
      private Integer artno;
      private String optionName;
      private String optionValue;
      }
   //
   @Data
   @AllArgsConstructor
   @NoArgsConstructor
   @Builder
   @Accessors(chain=true)
   public static class DtoForWrite{
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