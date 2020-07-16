package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Point {
	private Integer point;
	private LocalDateTime startDate;
	private LocalDateTime endDate;
	private String username;
	private Integer totalPoint;
}
