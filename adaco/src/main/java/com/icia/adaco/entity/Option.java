package com.icia.adaco.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Option {
	private Integer optno;
	private String optionName;
	private String optionValue;
	private Integer artno;
	private Integer optionStock;
	private Integer optionPrice;
}