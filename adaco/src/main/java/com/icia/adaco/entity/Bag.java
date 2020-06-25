package com.icia.adaco.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Bag {
	private String username;
	private Integer artno;
	private Integer totalPrice;
	private Integer amount;
	private String optionName;
	private String optionValue;
}
