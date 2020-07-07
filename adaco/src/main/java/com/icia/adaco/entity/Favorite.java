package com.icia.adaco.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Favorite {
	private Integer favno;
	private Integer artno;
	private String username;
	private String artName;
	private Integer price;
}
