package com.icia.adaco.entity;

import java.time.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class StoryComment {
	private Integer cno;
	private LocalDateTime writeDate;
	private String writer;
	private String content;
	private Integer storyno;
	private String username;
	private String profile;
}
