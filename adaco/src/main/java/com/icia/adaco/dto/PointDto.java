package com.icia.adaco.dto;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class PointDto {
	private int point;
	private String endDateStr;
	private String startDateStr;
	private int totalPoint;
	private String username;
}
