package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class Shop {
	private Integer shopNo;
	private String shopName;
	private Integer shopIntro;
	private String  businessno;
	private String account; 
}
