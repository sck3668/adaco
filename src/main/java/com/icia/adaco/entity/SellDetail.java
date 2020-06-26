package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class SellDetail {
	private Integer orderno;
	private String artName;
	private Integer price;
	private LocalDateTime sellDate;
}
