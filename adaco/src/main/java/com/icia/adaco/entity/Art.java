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
	private String mainImg;
	private String artImg;
	private Integer stock;
	private String tag;
	private LocalDateTime artDate;
	private Integer couriPrice;
	private String returnAddress;	//환불계좌
	private String courier;			//택배사
	private Integer readCnt;
	private Double accumulated; // 적립금
	private Integer favoriteCnt;
	private Boolean isFavorite;
	private String category;
	private Integer artistno;
	private Integer shopno;
	private String artDetail;
	private Integer reviewCnt;
	private Integer artCommentCnt;
}
