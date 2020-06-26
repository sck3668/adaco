package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Board {
	private Integer bno;
	private String writer;
	private String content;
	private String title;
	private LocalDateTime writeDate;
	private Integer commentCnt;
	private Integer readCnt;
	private Integer deleteCommentCnt;
	private Integer attachmentCnt;
	private boolean enabled;
	
}
