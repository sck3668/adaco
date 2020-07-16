package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Order {
	private int orderno;
	private LocalDateTime orderDate;
	private String username;
	private int shippingCharge;
	private int bagno;
}