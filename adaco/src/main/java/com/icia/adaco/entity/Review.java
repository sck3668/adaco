package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class Review {
	private Integer rno;
	private star star;
	private String content;
	private String image;
	private LocalDateTime writeDate;
	private Integer artno;
	private String username;
}
