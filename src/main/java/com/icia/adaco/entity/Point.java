package com.icia.adaco.entity;

import java.time.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Point {
	private Integer point;
	private LocalDateTime startDate;
	private LocalDateTime endDate;
	private String username;
}
