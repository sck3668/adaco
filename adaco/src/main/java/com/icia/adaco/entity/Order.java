package com.icia.adaco.entity;

import java.time.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Order {
	private Integer orderNo;
	private LocalDateTime oderDate;
	private String username;
	private Integer shippingCharge;
}
