package com.icia.adaco.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Favorite {
	private Integer favno;
	private Integer artno;
	private String username;
}
