package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class Notice {
	private Integer noticeNo;
	private String content;
	private String title;
	private LocalDateTime writeDate;
	private String writer;
}
