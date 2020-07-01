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
		private Integer artno;
		private String artName;
		private Integer price;
		private String artImg;
		private LocalDateTime artDate;
		private int orderPrice;
		private String count;		//수량
		private Integer couriPrice;	//배송비
	}
}
