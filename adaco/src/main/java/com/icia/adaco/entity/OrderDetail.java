package com.icia.adaco.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class OrderDetail {
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
	private orderState orderstate;
}