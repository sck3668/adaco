package com.icia.adaco.entity;

import java.time.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Order {
	private Integer orderno;
	private LocalDateTime orderDate;
	private String username;
	private Integer shippingCharge;
}
