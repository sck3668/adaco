package com.icia.adaco.dto;

import lombok.*;
import lombok.experimental.*;

public class PointDto {
	private PointDto() {}
	
	@Data
	@Builder
	@AllArgsConstructor
	@NoArgsConstructor
	@Accessors(chain = true)
	public static class DtoForList {
		private int point;
		private String startDateStr;
		private String endDateStr;
		private String username;
		private int totalPoint;
	}
}
