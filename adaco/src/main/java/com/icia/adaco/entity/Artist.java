package com.icia.adaco.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Artist {
	private Integer artistNo;
	private String artistInto;
	private String profile;
	private String username;
	private Integer shopno;
}
