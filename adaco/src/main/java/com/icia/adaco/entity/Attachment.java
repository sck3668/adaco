package com.icia.adaco.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
public class Attachment {
	private Integer ano;
	private String originalName;
	private String writer;
	private String saveFimeName;
	private String length;
	private Integer storyno;
	private boolean isImage;
	
}
