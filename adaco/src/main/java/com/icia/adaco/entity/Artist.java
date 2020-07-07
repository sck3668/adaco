package com.icia.adaco.entity;


import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Artist {
	private Integer artistno;
	private String artistIntro;
	private String profile;
	private String username;
}
