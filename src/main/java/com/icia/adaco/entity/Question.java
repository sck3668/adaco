package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class Question {
	private Integer qno;
	private String writer;
	private String answer;
	private String content;
	private String title;
	private String answerContent;
	private LocalDateTime writeDate;
	private LocalDateTime answerDate;
	private State state;	
}
