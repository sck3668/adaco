package com.icia.adaco.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class User {
	private String username;
	private String password;
	private String email;
	private String irum;
	private String tel;
	private String profile;
	private String address;
	private LocalDateTime joinDate;
	private LocalDateTime birthDate;
	private Boolean enabled;
	private String checkCode;
	private int loginFailureCnt;
}
