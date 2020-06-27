package com.icia.adaco.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Admin {
	private String admin;
	private String password;
}
