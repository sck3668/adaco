package com.icia.adaco.dto;

import lombok.*;

public class AdminUserDto {
	private AdminUserDto() {}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForUserList{
		private String username;
		private String email;
		private String irum;
		private String joinDateStr;
	}
}
