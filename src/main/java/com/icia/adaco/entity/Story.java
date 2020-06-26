package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class Story {
	private Integer storyNo;
	private String title;
	private LocalDateTime writeDate;
	private String image;
	private String content;
	private Integer artistNo;
}
