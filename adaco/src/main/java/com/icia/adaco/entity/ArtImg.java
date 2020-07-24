package com.icia.adaco.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ArtImg {
	private Integer imgno;
	private Integer artno;
	private String gyungro;		//이미지 저장 경로
}
