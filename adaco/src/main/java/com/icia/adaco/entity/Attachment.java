package com.icia.adaco.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
public class Attachment {
	private Integer ano;
	private String originalFileName;
	private String writer;
	private String saveFileName;
	private Integer length;		
	private Integer storyno;
	private boolean isImage;
	private String artno;
	private Integer noticeno;
}
