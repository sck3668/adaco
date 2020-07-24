package com.icia.adaco.dto;

import java.time.*;

import javax.validation.constraints.*;

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
		private String authority;
	}
	
	@Data
	@Accessors(chain=true)
	public static class DtoForRead {
		private String username;
		private String irum;
		private String email;
		private String tel;
		private String birthDateStr;
		private String profile;
		private String password;
		
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	@Builder
	@Accessors(chain=true)
	public static class DtoForUpdate {
		@Pattern(regexp="^[A-Za-z][A-Za-z0-9]{7,9}$", message="아이디는 영숫자 8~10자입니다" )
		private String username;
		@Pattern(regexp="^[가-힣]{2,5}$", message="이름은 한글 2~5자입니다")
		private String irum;
		@Pattern(regexp="(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,25}$", message="비밀번호는 특수문자를 포함하는 영숫자 8~10자입니다")
		private String password;
		@Pattern(regexp="(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,12}$", message="비밀번호는 특수문자를 포함하는 영숫자 8~10자입니다")
		private String newPassword;
		@Pattern(regexp="^[0-9]{9,11}$", message="전화번호는 숫자 9~11자입니다")
		private String tel;
		@Pattern(regexp="^[A-Za-z][A-Za-z0-9]+@[A-Za-z\\.]+$", message="잘못된 이메일 형식입니다")
		private String email;
		private String profile;
		private String birthDateStr;
	}
}
