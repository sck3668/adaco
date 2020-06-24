package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
public class ReviewComment {
	private Integer rno;
	private Integer star;
	private String content;
	private String image;
	private LocalDateTime writeTime;
	private Integer artno;
	private String username;
}
