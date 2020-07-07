package com.icia.adaco.dto;

import java.time.*;

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
}
