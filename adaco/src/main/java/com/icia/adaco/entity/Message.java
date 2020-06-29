package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class Message {
	private Integer mno;
	private String title;
	private String username;
	private String content;
	private LocalDateTime writeDate;
	private String sendId;
	private String recipientId;
	private Boolean msgCheck;
	private Boolean isSendMessage;
	private Boolean isReciverMessage;
	
}
