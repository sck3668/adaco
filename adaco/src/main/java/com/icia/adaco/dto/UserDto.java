package com.icia.adaco.dto;

import java.time.*;
import java.util.*;

import com.icia.adaco.entity.*;

import lombok.*;
import lombok.experimental.*;

public class UserDto {
	private UserDto() { }

	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Accessors(chain=true)
	@Builder
	public static class DtoForJoin {
		private String username;
		private String password;
		private String irum;
		private String email;
		private String tel;
		private String profile;
		private LocalDateTime birthDate;
		private String address;
		private List<String> authorities;
	}
}
