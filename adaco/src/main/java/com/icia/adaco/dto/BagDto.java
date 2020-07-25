package com.icia.adaco.dto;

import java.time.*;
import java.util.*;

import com.icia.adaco.entity.*;

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
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	@Accessors(chain=true)
	public static class DtoForList{
		private String username;
		private int artno;
		private int totalPrice;
		private Integer amount;		//수량
		private String optionName;
		private String optionValue;
		private int optionPrice;
		private Art art;
		public int lastPrice;
		public int lastPrice(int totalPrice) {
			int lastPrice = 0;
			return lastPrice += totalPrice;
		}
	}
}
