package com.icia.adaco.exception;

import lombok.*;

@AllArgsConstructor
public class JobFailException extends RuntimeException {
	private String message;
	
	@Override
	public String getMessage() {
		return message ;
	}
}
