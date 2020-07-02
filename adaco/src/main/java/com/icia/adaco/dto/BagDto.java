package com.icia.adaco.dto;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

public class BagDto {
	private BagDto() {
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	@Accessors(chain=true)
	public static class DtoForWrite{
		private int artno;
		private String artName;
		private Integer price;
		private String mainImg;
		private LocalDateTime artDate;
		private int totalPrice;
		private Integer amount;		//수량
		private Integer couriPrice;	//배송비
		private String optionName;
		private String optionValue;
	}
}
