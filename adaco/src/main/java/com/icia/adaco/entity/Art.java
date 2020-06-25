package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Art {
	private Integer artno;
	private String artName;
	private Integer price;
	private boolean mainImg;
	private boolean artImg;
	private Integer stock;
	private String tag;
	private LocalDateTime artDate;
	private Integer couriPrice;
	private Integer shippingPrice;
	private String returnAddress;
	private String courier;
	private Integer readCnt;
	private Integer accumulated; // 택배사
	private boolean favorite;
	private String category;
	private Integer artistNo;
	private Integer shopNo;
}
