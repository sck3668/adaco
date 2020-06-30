package com.icia.adaco.dto;

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
		private String birthDate;
		private String address;
		private String authority;
	}
}
