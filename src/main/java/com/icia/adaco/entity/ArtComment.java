package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class ArtComment {
	private Integer cno;
	private LocalDateTime writeDate;
	private String profile;
	private String content;
	private Integer reportCnt;
	private String username;
	private Integer artno;
}
