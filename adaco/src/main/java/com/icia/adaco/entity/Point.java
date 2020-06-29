package com.icia.adaco.entity;

import java.time.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Point {
	private Integer point;
	private LocalDateTime startDate;
	private LocalDateTime endDate;
	private String username;
}
