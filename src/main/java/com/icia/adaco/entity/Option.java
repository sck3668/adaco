package com.icia.adaco.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Option {
	private Integer optno;
	private String name;
	private String value;
	private Integer artno;
}
