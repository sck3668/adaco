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
	public enum type{
		waking, runnin, tracking, hiking
	}
	private Integer rno;
	private star star;
	private String content;
	private String image;
	private type type;
	private LocalDateTime writeTime;
	private Integer artno;
	private String username;
}
