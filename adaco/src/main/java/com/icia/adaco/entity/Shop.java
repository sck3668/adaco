
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
	private String businessno;	//사업자번호
	private String account;		//계좌
	private String image;
	private String forwarding;	//출고지
	private String back;		//반품지
}
