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
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForArtistList{
		private int artistno;
		private String username;
		private String email;
		private String irum;
		private String joinDateStr;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	public static class DtoForUserRead{
		private String username;
		private String email;
		private String irum;
		private String tel;
		private String profile;
		private String address;
		private String joinDateStr;
		private String birthDateStr;
		private String authority;
		private Boolean enabled;
		private long days;
	}
}
