
package com.icia.adaco.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class Shop {
	private Integer shopno;
	private Integer artistno;
	private String shopName;
	private String shopIntro;
	private String businessno;
	private String account;
	private String image;
	private String forwarding;
	private String back;
}
